
view: vw_largo_plazo_presupuesto {
  derived_table: {
    sql:

      with



     tmplptrazabilidad as(
      select *
      from psa-psa-cadena-qa.reporting_ecc_mx.tb_largo_plazo_trazabilidad
      where id_concepto in (1,2,3,14,16,17)
     ),



     -------------------------------------------------------------------------------------------------------------------------------------------------------------------
     -----------------El siguiiente c+odigo se comenta ya que solo su usa para validar que no existan sku en almacenes con mas de dos formas de indicador de precios----
     -------------------------------------------------------------------------------------------------------------------------------------------------------------------
    /* select agrupadofinal.*
      from
      (
      select agrupadoprevio.centro,
            agrupadoprevio.material, sum(1) as nveces
      from
      (
      SELECT centro,
            material,
            indicador_control_precios As indicadorprecio,
                  max(precio_medio_variable) as precio_medio_variable,
                  max(precio_estandar) as precio_estandar,
                  max(precio_absorbente) as precio_absorbente,
            FROM `psa-sga-dfn-qa.reporting_ecc_mx.vw_cadena_suministro_datos_generales`
            where material='000000000004033190'
            group by 1,2,3
      ) as agrupadoprevio
      group by 1,2
      ) As agrupadofinal      where agrupadofinal.nveces>1*/
      ---------------------------------------------------------------------------------------------------------------------------------------------------------------
      -------------------------------------Termina-------------------------------------------------------------------------------------------------------------------
      ---------------------------------------------------------------------------------------------------------------------------------------------------------------
      vw_costos As (
            select vw_dg_pre.centro,
                   vw_dg_pre.material,
                   vw_dg_pre.indicadorprecio,
                   case when vw_dg_pre.indicadorprecio='V'
                              then case when vw_dg_pre.precio_medio_variable is null then 0 else vw_dg_pre.precio_medio_variable end
                        when vw_dg_pre.indicadorprecio='S'
                              then case when vw_dg_pre.precio_estandar is null then 0 else vw_dg_pre.precio_estandar end
                     end As costo,
--                   case when vw_dg_pre.precio_medio_variable is null then 0 else vw_dg_pre.precio_medio_variable end As precio_medio_variable,
--                   case when vw_dg_pre.precio_estandar is null then 0 else vw_dg_pre.precio_estandar end As precio_estandar,
                     case when vw_dg_pre.precio_absorbente is null then 0 else vw_dg_pre.precio_absorbente end As costo_absorbente
            from  (
                    SELECT vw_dg.centro,
                        vw_dg.material,
                        vw_dg.indicador_control_precios As indicadorprecio,
                        max(vw_dg.precio_medio_variable) as precio_medio_variable,
                        max(vw_dg.precio_estandar) as precio_estandar,
                        max(vw_dg.precio_absorbente) as precio_absorbente,
                   FROM `psa-sga-dfn-qa.reporting_ecc_mx.vw_cadena_suministro_datos_generales` as vw_dg
                 --  where material='000000000004000072'

                   group by 1,2,3
                   ) As vw_dg_pre
                  )
      ,

      vw_cuantosprecios As (
                              select count(distinct material ) as cuantos
                              from psa-psa-cadena-qa.reporting_powerbi_mx.vw_ventas_preciounitario
                        ),



     /*
      vw_preciosventa as (
            select tmplptrazabilidad.centro  as centro,
                  tmplptrazabilidad.sku as sku,
                  tmplptrazabilidad.periodo as periodo,
                  case when vw_cuantosprecios.cuantos=0 then 1
                       when prciounitarioventa .material is null then 0
                       else prciounitarioventa .preciounitario*1
                  end as preciounitario,
            from   vw_cuantosprecios,
                   tmplptrazabilidad
            left outer join
                  (Select pu.centro,
                          pu.material,
                          concat(pu.anio,'-',substr(pu.mes,2,2)) as periodo,
                        --  max(pu.preciounitario) as preciounitario
                        avg(pu.preciounitario) as preciounitario
                     from psa-psa-cadena-qa.reporting_powerbi_mx.vw_ventas_preciounitario as pu
                     where pu.preciounitario is not null
               --      where material='000000000004000072'
                     group by 1,2,3
                     order by 1,2,3
                  ) as prciounitarioventa
                  on tmplptrazabilidad.centro=prciounitarioventa.centro --vw_preciosventa.centro ----
                  and tmplptrazabilidad.sku=prciounitarioventa.material
                  and tmplptrazabilidad.periodo= prciounitarioventa.periodo
        ),

        */

            vw_preciosventa as (
            select prciounitarioventa.material as sku,
                   case --when vw_cuantosprecios.cuantos=0 then 1
                        when prciounitarioventa.importetotal is null then 0
                        when prciounitarioventa.cantidad     is null then 0
                        else prciounitarioventa.importetotal/prciounitarioventa.cantidad
                  end as preciounitario,
            from  -- vw_cuantosprecios,
                  (Select -- pu.centro,
                          pu.material,
                          sum(pu.UMBTotales) as Cantidad,
                          sum(pu.Ventas)     as ImporteTotal
                     from psa-psa-cadena-qa.reporting_powerbi_mx.vw_ventas_preciounitario as pu
                     where pu.preciounitario is not null
                     group by 1 --,2
                     order by 1 --,2
                  ) as prciounitarioventa
            )
            ,

      vw_metas as (
                  select tmplptrazabilidad.centro  as centro,
                        tmplptrazabilidad.sku as sku,
                        tmplptrazabilidad.periodo as periodo,
                        metaventa.metaunitaria
                  from  tmplptrazabilidad
                  left outer join
                        (Select if(meta.centro is null or length(meta.centro)=0,'XXXX', meta.centro) as centro,
                                meta.material,
                                concat(meta.anio,substr(meta.mes,2,2)) as periodo,
                                max(Case when meta.unidades_meta is null or meta.unidades_meta=0 or valores_meta is null or valores_meta=0 then 0.00
                                         else meta.unidades_meta/valores_meta
                                     end
                                   ) as metaunitaria
                        from psa-psa-cadena-qa.reporting_powerbi_mx.vw_meta_pisa as meta
                        where length(meta.centro)>0
                        group by 1,2,3
                        order by 1,2,3
                        ) metaventa
                        on tmplptrazabilidad.centro=metaventa.centro
                        and tmplptrazabilidad.sku=metaventa.material
                        and tmplptrazabilidad.periodo= metaventa.periodo
      ),


      vw_tablero_largo_plazo_presupuesto_renglon_01 AS (
      select tmplptrazabilidad.*,
             ' $' As signo,
             Case
                  when vw_cuantosprecios.cuantos=0 then 99999999.99999 ------(vw_costos.costo*1.333333333)*tmplptrazabilidad.Cantidad
                  else
                       vw_preciosventa.preciounitario*
                       tmplptrazabilidad.Cantidad
             end As precioventa,
            vw_costos.costo * tmplptrazabilidad.Cantidad as costo,
            vw_costos.costo_absorbente*tmplptrazabilidad.Cantidad as costo_absorbente

      from  vw_cuantosprecios,
            tmplptrazabilidad
      left outer join vw_costos
            on vw_costos.material=tmplptrazabilidad.sku
            and vw_costos.centro=tmplptrazabilidad.centro
      left outer join vw_preciosventa
             on vw_preciosventa.sku = tmplptrazabilidad.sku
       where tmplptrazabilidad.id_concepto=1
      )
     ,

      vw_tablero_largo_plazo_presupuesto_renglon_02 AS (
      select tmplptrazabilidad.*,
            ' $' As signo,
             Case
                  when vw_cuantosprecios.cuantos=0 then 999999.9999----(vw_costos.costo*1.333333333)*tmplptrazabilidad.Cantidad
                  else vw_preciosventa.preciounitario*tmplptrazabilidad.Cantidad
              end As precioventa,
             vw_costos.costo*tmplptrazabilidad.Cantidad as costo,
             vw_costos.costo_absorbente*tmplptrazabilidad.Cantidad as costo_absorbente
      from  vw_cuantosprecios,
            tmplptrazabilidad
      inner join vw_costos
            on vw_costos.material=tmplptrazabilidad.sku
            and vw_costos.centro=tmplptrazabilidad.centro
      inner join vw_preciosventa
            -- vw_preciosventa.centro=tmplptrazabilidad.centro
            on vw_preciosventa.sku = tmplptrazabilidad.sku
            -- vw_preciosventa.periodo=tmplptrazabilidad.periodo
      where tmplptrazabilidad.id_concepto=2
      )

     ,



  vw_tablero_largo_plazo_presupuesto_renglon_03 AS (
    select tmplptrazabilidad.*,
           ' $' As signo,
             Case
                  when vw_cuantosprecios.cuantos=0 then 99999.9999 ---(vw_costos.costo*1.333333333)*tmplptrazabilidad.Cantidad
                  else vw_preciosventa.preciounitario*tmplptrazabilidad.Cantidad
              end As precioventa,
             vw_costos.costo *tmplptrazabilidad.Cantidad as costo,
             vw_costos.costo_absorbente*tmplptrazabilidad.Cantidad as importe_absorbente
      from  vw_cuantosprecios,
            tmplptrazabilidad
      inner join vw_costos
            on vw_costos.material=tmplptrazabilidad.sku
            and vw_costos.centro=tmplptrazabilidad.centro
      inner join vw_preciosventa
             on vw_preciosventa.sku = tmplptrazabilidad.sku
      where tmplptrazabilidad.id_concepto=3
      )
      ,

      vw_tablero_largo_plazo_presupuesto_renglon_04 AS (
      select r01.tipomaterial,
             r01.um,
             r01.grupoarticulo,
             r01.grupoarticuloexterno,
             r01.claveidioma,
             r01.articulodescribe,
              4 as id_concepto,
             '%' as Concepto,
             r01.centro,
             r01.sku,
             r01.periodonum,
             r01.periodo,
             '' As signo,
             r01.cantidad,
             case
                  when
                        r01.precioventa is null or r02.precioventa is null or r01.precioventa=0 or r02.precioventa=0 then 0
                  else
                        ((r02.precioventa/r01.precioventa)-1)*100
             end as precioventa,

            case
                  when
                        r01.costo is null or r02.costo is null or r01.costo=0 or r02.costo=0 then 0
                  else
                        ((r02.costo/r01.costo)-1)*100
             end as costo,


             case
                  when
                        r01.costo_absorbente is null or r02.costo_absorbente is null or r01.costo_absorbente=0 or r02.costo_absorbente=0 then 0
                  else
                        ((r02.costo_absorbente/r01.costo_absorbente)-1)*100
             end as costo_absorbente,

      from vw_tablero_largo_plazo_presupuesto_renglon_01 as r01
      left outer join  vw_tablero_largo_plazo_presupuesto_renglon_02 As r02
            on r02.sku=r01.sku
            and r02.periodo=r01.periodo
            and r02.centro=r01.centro
      )

      ,


      vw_tablero_largo_plazo_presupuesto_renglon_05 AS (
      select r14.tipomaterial,
             r14.um,
             r14.grupoarticulo,
             r14.grupoarticuloexterno,
             r14.claveidioma,
             r14.articulodescribe,
              5 as id_concepto,
             'COBERTURA DE LA DEMANDA' as Concepto,
             r14.centro,
             r14.sku,
             r14.periodonum,
             r14.periodo,
             r14.cantidad,
             ' $' As signo,
             Case
                  when vw_cuantosprecios.cuantos=0 then 999999.99999 /* ---- (vw_costos.costo*1.333333333)*r14.Cantidad  */
                  else vw_preciosventa.preciounitario*r14.Cantidad
             end As precioventa,
             vw_costos.costo*r14.Cantidad as costo,
             vw_costos.costo_absorbente*r14.Cantidad as costo_absorbente
       from  vw_cuantosprecios,
            tmplptrazabilidad As r14
      inner join vw_costos
            on vw_costos.material=r14.sku
            and vw_costos.centro=r14.centro
      inner join vw_preciosventa
         --   on vw_preciosventa.centro=r14.centro
            on vw_preciosventa.sku = r14.sku
        --    and vw_preciosventa.periodo=r14.periodo
      where r14.id_concepto=14
      ),


      vw_tablero_largo_plazo_presupuesto_renglon_06 AS (
      select r14.tipomaterial,
             r14.um,
             r14.grupoarticulo,
             r14.grupoarticuloexterno,
             r14.claveidioma,
             r14.articulodescribe,
              6 as id_concepto,
             'COSTO DIRECTO DE DEMANDA CUBIERTA' as Concepto,
             r14.centro,
             r14.sku,
             r14.periodonum,
             r14.periodo,
             ' $' As signo,
             r14.cantidad,

            Case
                  when vw_cuantosprecios.cuantos=0 then 99999.9999    ---(vw_costos.costo*1.333333333)*r14.Cantidad
                  else vw_preciosventa.preciounitario*r14.Cantidad
             end As precioventa,
             vw_costos.costo *r14.Cantidad as costo,
             vw_costos.costo_absorbente*r14.Cantidad as costo_absorbente
       from  vw_cuantosprecios,
            tmplptrazabilidad As r14
      inner join vw_costos
            on vw_costos.material=r14.sku
            and vw_costos.centro=r14.centro
      inner join vw_preciosventa
         --   on vw_preciosventa.centro=r14.centro
           on vw_preciosventa.sku = r14.sku
        --    and vw_preciosventa.periodo=r14.periodo
      where r14.id_concepto=14
      )
      ,


      vw_tablero_largo_plazo_presupuesto_renglon_07 AS (
      select r05.tipomaterial,
             r05.um,
             r05.grupoarticulo,
             r05.grupoarticuloexterno,
             r05.claveidioma,
             r05.articulodescribe,
              7 as id_concepto,
             'MARGEN BRUTO DE DEMANDA CUBIERTA' as Concepto,
             r05.centro,
             r05.sku,
             r05.periodonum,
             r05.periodo,
             ' $' As signo,
             r05.cantidad,
             r05.precioventa-r06.costo as margen,
             0,
             0
      from vw_tablero_largo_plazo_presupuesto_renglon_05 as r05
      left outer join  vw_tablero_largo_plazo_presupuesto_renglon_06 As r06
            on r06.sku=r05.sku
            and r06.periodo=r05.periodo
            and r06.centro=r05.centro
      )
      ,


      vw_tablero_largo_plazo_presupuesto_renglon_08 AS (
      select r05.tipomaterial,
             r05.um,
             r05.grupoarticulo,
             r05.grupoarticuloexterno,
             r05.claveidioma,
             r05.articulodescribe,
              8 as id_concepto,
             '%' as Concepto,
             r05.centro,
             r05.sku,
             r05.periodonum,
             r05.periodo,
             '' As signo,
             r05.cantidad,
             case when r05.precioventa is null or r06.costo is null then 0.0
                  when r05.precioventa=0 and r06.costo=0 then 0.00
                  when r05.precioventa=0 and r06.costo>0 then -100.00
                  when r05.precioventa=0 and r06.costo<0 then 0
                  when r05.precioventa>0 and r06.costo=0 then 100.00
                  when r05.precioventa<0 and r06.costo=0 then -100.00
                  else  (r06.costo/r05.precioventa) *100 -- (1-(r06.costo/r05.precioventa ))
               end as margenporciento,
             0,
             0
      from vw_tablero_largo_plazo_presupuesto_renglon_05 as r05
      left outer join  vw_tablero_largo_plazo_presupuesto_renglon_06 As r06
            on r06.sku=r05.sku
            and r06.periodo=r05.periodo
            and r06.centro=r05.centro
      )
      ,

      vw_tablero_largo_plazo_presupuesto_renglon_09 AS (
      select r05.tipomaterial,
             r05.um,
             r05.grupoarticulo,
             r05.grupoarticuloexterno,
             r05.claveidioma,
             r05.articulodescribe,
              9 as id_concepto,
             'COBERTURA DE LA DEMANDA' as Concepto,
             r05.centro,
             r05.sku,
             r05.periodonum,
             r05.periodo,
             r05.cantidad,
             ' $' As signo,
             r05.precioventa,
             r05.costo,
             r05.costo_absorbente
       from  vw_tablero_largo_plazo_presupuesto_renglon_05 as r05
     )
      ,

      vw_tablero_largo_plazo_presupuesto_renglon_10 AS (
      select r14.tipomaterial,
             r14.um,
             r14.grupoarticulo,
             r14.grupoarticuloexterno,
             r14.claveidioma,
             r14.articulodescribe,
             10 as id_concepto,
             'COSTO ABSORBENTE DE DEMANDA CUBIERTA' as Concepto,
             r14.centro,
             r14.sku,
             r14.periodonum,
             r14.periodo,
             ' $' As signo,
             0 as cantidad,
             0,
             0,
             vw_costos.costo_absorbente*r14.Cantidad as costo_absorbente
       from  vw_cuantosprecios,
            tmplptrazabilidad As r14
      inner join vw_costos
            on vw_costos.material=r14.sku
            and vw_costos.centro=r14.centro
      inner join vw_preciosventa
          --  on vw_preciosventa.centro=r14.centro
            on vw_preciosventa.sku = r14.sku
         --   and vw_preciosventa.periodo=r14.periodo
      where r14.id_concepto=14
      )
      ,

      vw_tablero_largo_plazo_presupuesto_renglon_11 AS (
      select r09.tipomaterial,
             r09.um,
             r09.grupoarticulo,
             r09.grupoarticuloexterno,
             r09.claveidioma,
             r09.articulodescribe,
              11 as id_concepto,
             'MARGEN BRUTO DE DEMANDA CUBIERTA' as Concepto,
             r09.centro,
             r09.sku,
             r09.periodonum,
             r09.periodo,
             ' $' As signo,
             r09.cantidad,
             r09.precioventa-r10.costo_absorbente as margen,
             0,
             0
      from vw_tablero_largo_plazo_presupuesto_renglon_09 as r09
      left outer join  vw_tablero_largo_plazo_presupuesto_renglon_10 As r10
            on r10.sku=r09.sku
            and r10.periodo=r09.periodo
            and r10.centro=r09.centro
      )

      ,

      vw_tablero_largo_plazo_presupuesto_renglon_12 AS (
      select r09.tipomaterial,
             r09.um,
             r09.grupoarticulo,
             r09.grupoarticuloexterno,
             r09.claveidioma,
             r09.articulodescribe,
              12 as id_concepto,
             '%' as Concepto,
             r09.centro,
             r09.sku,
             r09.periodonum,
             r09.periodo,
             '' As signo,
             r09.cantidad,
             case when r09.precioventa is null or r10.costo_absorbente is null then 0.0
                  when r09.precioventa=0 and r10.costo_absorbente=0 then 0.00
                  when r09.precioventa=0 and r10.costo_absorbente>0 then -100.00
                  when r09.precioventa=0 and r10.costo_absorbente<0 then 0
                  when r09.precioventa>0 and r10.costo_absorbente=0 then 100.00
                  when r09.precioventa<0 and r10.costo_absorbente=0 then -100.00
                  else (r10.costo_absorbente/r09.precioventa) *100 -- (1-(r10.costo_absorbente/r09.precioventa ))
               end as margenporciento,
             0,
             0
      from vw_tablero_largo_plazo_presupuesto_renglon_09 as r09
      left outer join  vw_tablero_largo_plazo_presupuesto_renglon_10 As r10
            on r10.sku=r09.sku
            and r10.periodo=r09.periodo
            and r10.centro=r09.centro
      )
      ,
      vw_tablero_largo_plazo_presupuesto_renglon_13 AS (
      select tmplptrazabilidad.tipomaterial,
             tmplptrazabilidad.um,
             tmplptrazabilidad.grupoarticulo,
             tmplptrazabilidad.grupoarticuloexterno,
             tmplptrazabilidad.claveidioma,
             tmplptrazabilidad.articulodescribe,
              13 as id_concepto,
             'DEMANDA NO CUBIERTA' as Concepto,
             tmplptrazabilidad.centro,
             tmplptrazabilidad.sku,
             tmplptrazabilidad.periodonum,
             tmplptrazabilidad.periodo,
             ' $' As signo,
             0 as cantidad,
             Case
                  when vw_cuantosprecios.cuantos=0 then 999999.9999  ---(vw_costos.costo*1.333333333)*tmplptrazabilidad.Cantidad
                  else vw_preciosventa.preciounitario*tmplptrazabilidad.Cantidad
             end As precioventa,
            0 as costo,
            0 as costo_absorbente

      from  vw_cuantosprecios,
            tmplptrazabilidad
      inner join vw_costos
            on vw_costos.material=tmplptrazabilidad.sku
            and vw_costos.centro=tmplptrazabilidad.centro
      inner join vw_preciosventa
           -- on vw_preciosventa.centro=tmplptrazabilidad.centro
            on vw_preciosventa.sku = tmplptrazabilidad.sku
          --- and vw_preciosventa.periodo=tmplptrazabilidad.periodo
      where tmplptrazabilidad.id_concepto=16
      ) ,


      vw_tablero_largo_plazo_presupuesto_renglon_14 AS (
      select tmplptrazabilidad.tipomaterial,
             tmplptrazabilidad.um,
             tmplptrazabilidad.grupoarticulo,
             tmplptrazabilidad.grupoarticuloexterno,
             tmplptrazabilidad.claveidioma,
             tmplptrazabilidad.articulodescribe,
              14 as id_concepto,
             '%' as Concepto,
             tmplptrazabilidad.centro,
             tmplptrazabilidad.sku,
             tmplptrazabilidad.periodonum,
             tmplptrazabilidad.periodo,
             '' As signo,
             0 as cantidad,
             0,
             0,
             tmplptrazabilidad.cantidad as porcientofaltante,


      from  tmplptrazabilidad
      where tmplptrazabilidad.id_concepto=17
      )

 ,
      vw_tablero_largo_plazo_presupuesto_renglon_15 AS (
      select tmplptrazabilidad.tipomaterial,
             tmplptrazabilidad.um,
             tmplptrazabilidad.grupoarticulo,
             tmplptrazabilidad.grupoarticuloexterno,
             tmplptrazabilidad.claveidioma,
             tmplptrazabilidad.articulodescribe,
              15 as id_concepto,
             'PRESUPUESTO DE VENTAS' as Concepto,
             tmplptrazabilidad.centro,
             tmplptrazabilidad.sku,
             tmplptrazabilidad.periodonum,
             tmplptrazabilidad.periodo,
             ' $' As signo,
             0 as cantidad,
             vw_metas.metaunitaria as metaunitaria,
             0 ,
             0

      from  tmplptrazabilidad
      inner join vw_costos
            on vw_costos.material=tmplptrazabilidad.sku
            and vw_costos.centro=tmplptrazabilidad.centro
      inner join vw_metas
            on vw_metas.centro=tmplptrazabilidad.centro
            and vw_metas.sku = tmplptrazabilidad.sku
            and vw_metas.periodo=tmplptrazabilidad.periodo
      where tmplptrazabilidad.id_concepto=1
      )
      ,
      vw_tablero_largo_plazo_presupuesto_renglon_16 AS (
      select r05.tipomaterial,
             r05.um,
             r05.grupoarticulo,
             r05.grupoarticuloexterno,
             r05.claveidioma,
             r05.articulodescribe,
              16 as id_concepto,
             '%' as Concepto,
             r05.centro,
             r05.sku,
             r05.periodonum,
             r05.periodo,
             '' As signo,
             r05.cantidad,
             case when r05.precioventa is null or r15.metaunitaria is null then 0.0
                  when r05.precioventa=0 and r15.metaunitaria=0 then 0.00
                  when r05.precioventa=0 and r15.metaunitaria>0 then -100.00
                  when r05.precioventa=0 and r15.metaunitaria<0 then 0
                  when r05.precioventa>0 and r15.metaunitaria=0 then 100.00
                  when r05.precioventa<0 and r15.metaunitaria=0 then -100.00
                  else  (r15.metaunitaria/r05.precioventa ) *100 --(1-(r15.metaunitaria/r05.precioventa ))
               end as margenporciento,
             0,
             0
      from vw_tablero_largo_plazo_presupuesto_renglon_05 as r05
      left outer join  vw_tablero_largo_plazo_presupuesto_renglon_15 As r15
            on r15.sku=r05.sku
            and r15.periodo=r05.periodo
            and r15.centro=r05.centro
      )
      ,

      vw_tablero_largo_plazo_presupuesto_renglon_17 AS (
      select r05.tipomaterial,
             r05.um,
             r05.grupoarticulo,
             r05.grupoarticuloexterno,
             r05.claveidioma,
             r05.articulodescribe,
              17 as id_concepto,
             'COMPRAS - ADQUISICIÓN DE INSUMOS' as Concepto,
             r05.centro,
             r05.sku,
             r05.periodonum,
             r05.periodo,
             ' $' As signo,
             0 as cantidad,
             0,
             0,
             0
      from vw_tablero_largo_plazo_presupuesto_renglon_05 as r05
      left outer join  vw_tablero_largo_plazo_presupuesto_renglon_15 As r15
            on r15.sku=r05.sku
            and r15.periodo=r05.periodo
            and r15.centro=r05.centro
      ) ,

      vw_tablero_largo_plazo_presupuesto_renglon_18 AS (
      select r05.tipomaterial,
             r05.um,
             r05.grupoarticulo,
             r05.grupoarticuloexterno,
             r05.claveidioma,
             r05.articulodescribe,
              18 as id_concepto,
             'VALOR DEL INVENTARIO PT' as Concepto,
             r05.centro,
             r05.sku,
             r05.periodonum,
             r05.periodo,
             '' As signo,
             0 as cantidad,
             0,
             0,
             0
      from vw_tablero_largo_plazo_presupuesto_renglon_05 as r05
      left outer join  vw_tablero_largo_plazo_presupuesto_renglon_15 As r15
            on r15.sku=r05.sku
            and r15.periodo=r05.periodo
            and r15.centro=r05.centro
      )


select renglones.*
from (
      select * except(cantidad), precioventa       as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_01 union all
      select * except(cantidad), precioventa       as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_02 union all
      select * except(cantidad), precioventa       as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_03 union all
      select * except(cantidad), precioventa       as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_04 union all
      select * except(cantidad), precioventa       as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_05 union all
      select * except(cantidad), costo             as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_06 union all
      select * except(cantidad), margen            as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_07 union all
      select * except(cantidad), margenporciento   as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_08 union all
      select * except(cantidad), precioventa       as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_09 union all
      select * except(cantidad), costo_absorbente  as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_10 union all
      select * except(cantidad), margen            as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_11 union all
      select * except(cantidad), margenporciento   as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_12 union all
      select * except(cantidad), precioventa       as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_13 union all
      select * except(cantidad), porcientofaltante as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_14 union all
      select * except(cantidad), metaunitaria      as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_15 union all
      select * except(cantidad), margenporciento   as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_16 union all
      select * except(cantidad), cantidad          as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_17 union all ----Como obtener el costo de insumoes, pendiente---
      select * except(cantidad), cantidad          as cantidad from vw_tablero_largo_plazo_presupuesto_renglon_18             ----ver con Mara pendiente---
       ) As renglones
      where  grupoarticulo in  ('AM',
'A',
'T',
'O',
'L',
'E',
'G',
'K',
'GP',
'U',
'J',
'MI',
'M',
'MP',
'S',
'F',
'D',
'H',
'Q',
'PMD',
'SM',
'B',
'R',
'N',
'VDD')    and centro in ('DA11',
'DR08',
'PI15',
'PI11',
'DR13',
'DN01',
'PI06',
'DR21',
'DR17',
'PI12',
'DR10',
'DN11',
'DR16',
'DR15',
'PI14',
'AI01',
'PI08',
'PI10',
'PT01',
'DA09',
'DA03',
'DA28',
'DA19',
'AM01',
'DA08',
'DA13',
'DA01',
'DA02',
'DN05',
'DN18',
'DN19',
'DA20',
'DR01',
'PI19',
'PI13',
'DN08',
'DA21',
'DA22',
'DE01',
'PI05',
'DR20',
'PI01',
'PG20'
)

      --where SKU='000000000004000072'

      --where SKU='000000000004000072'




   ;;
  }


  parameter: Tipo_Ptto {
    label: "Tipo Ptro"
    type: unquoted



    allowed_value: {
      label: "Costo"
      value: "Costo"
    }

    allowed_value: {
      label: "Cantidad"
      value: "Cantidad"
    }


    allowed_value: {
      label: "Importe Absorbente"
      value: "importe_Absorbente"
    }

  }


measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: tipomaterial {
  type: string
  sql: ${TABLE}.tipomaterial ;;
}

dimension: um {
  type: string
  sql: ${TABLE}.um ;;
}

#dimension: grupoarticulo {
 # type: string
  #sql: ${TABLE}.grupoarticulo ;;
#}

  dimension: grupoarticulo {
    type: string
    sql: case when  ${TABLE}.grupoarticulo = 'AM' then 'AMSA'
              when  ${TABLE}.grupoarticulo = 'A' then 'Anestesiología y Terapia Intensiva'
              when  ${TABLE}.grupoarticulo = 'T' then 'Antibióticos Intra-Hospitalarios'
              when  ${TABLE}.grupoarticulo = 'O' then 'Antibióticos de Prescripción'
              when ${TABLE}.grupoarticulo = 'L' then 'Control de Infecciones'
              when ${TABLE}.grupoarticulo = 'E' then 'Diálisis Peritoneal'
              when ${TABLE}.grupoarticulo = 'G' then 'Enfermedades Crónicas'
              when ${TABLE}.grupoarticulo = 'K' then 'Farmacéuticos OTC'
              when ${TABLE}.grupoarticulo = 'GP' then 'GENEPISA'
               when ${TABLE}.grupoarticulo = 'J' then 'Hemodiálisis'
      when ${TABLE}.grupoarticulo = 'MI' then 'Maquila Intl.'
      when ${TABLE}.grupoarticulo = 'M' then 'Maquila Nacional'
      when ${TABLE}.grupoarticulo = 'MP' then 'Marca Propia'
      when ${TABLE}.grupoarticulo = 'S' then 'NEUROLOGÍA y PSIQUIATRÍA'
      when ${TABLE}.grupoarticulo = 'F' then 'Nutrición'
      when ${TABLE}.grupoarticulo = 'D' then 'Oftalmología'
      when ${TABLE}.grupoarticulo = 'H' then 'Oncológicos'
      when ${TABLE}.grupoarticulo = 'Q' then 'Pediatría'
      when ${TABLE}.grupoarticulo = 'PMD' then 'Productos Medimix'
      when ${TABLE}.grupoarticulo = 'SM' then 'Salucom'
      when ${TABLE}.grupoarticulo = 'B' then 'Terapia de Infusión'
      when ${TABLE}.grupoarticulo = 'R' then 'Terapia del dolor'
      when ${TABLE}.grupoarticulo = 'N' then 'Transplantes'
      when ${TABLE}.grupoarticulo = 'VDD' then 'Venta Directa Dimesa'
      when ${TABLE}.grupoarticulo = 'U' then 'Genéricos'
      else ${TABLE}.grupoarticulo END  ;;
  }


dimension: grupoarticuloexterno {
  type: string
  sql: ${TABLE}.grupoarticuloexterno ;;
}

dimension: claveidioma {
  type: string
  sql: ${TABLE}.claveidioma ;;
}

dimension: articulodescribe {
  type: string
  sql: ${TABLE}.articulodescribe ;;
}

dimension: id_concepto {
  type: number
  sql: ${TABLE}.id_Concepto ;;
}

dimension: concepto {
  type: string
  sql: case when  ${TABLE}.Concepto in  ('%','% DEMANDA NO CUBIERTA','% COBERTURA DE LA DEMANDA (INVENTARIO EN LU)') then ${TABLE}.Concepto else concat(${TABLE}.Concepto,' $') end ;;
}

dimension: centro {
  type: string
  sql: ${TABLE}.centro ;;
}



  dimension: planta {
    type: string
    sql: case when ${TABLE}.centro='DA11' then 'Centro de Distribución'
when ${TABLE}.centro='DR08' then 'Centro de Distribución'
when ${TABLE}.centro='PI15' then 'Planta'
when ${TABLE}.centro='PI11' then 'Planta'
when ${TABLE}.centro='DR13' then 'Centro de Distribución'
when ${TABLE}.centro='DN01' then 'Centro de Distribución'
when ${TABLE}.centro='PI06' then 'Planta'
when ${TABLE}.centro='DR21' then 'Centro de Distribución'
when ${TABLE}.centro='DR17' then 'Centro de Distribución'
when ${TABLE}.centro='PI12' then 'Planta'
when ${TABLE}.centro='DR10' then 'Centro de Distribución'
when ${TABLE}.centro='DN11' then 'Centro de Distribución'
when ${TABLE}.centro='DR16' then 'Centro de Distribución'
when ${TABLE}.centro='DR15' then 'Centro de Distribución'
when ${TABLE}.centro='PI14' then 'Planta'
when ${TABLE}.centro='AI01' then 'Centro de Distribución'
when ${TABLE}.centro='PI08' then 'Planta'
when ${TABLE}.centro='PI10' then 'Planta'
when ${TABLE}.centro='PT01' then 'Centro de Distribución'
when ${TABLE}.centro='DA09' then 'Centro de Distribución'
when ${TABLE}.centro='DA03' then 'Centro de Distribución'
when ${TABLE}.centro='DA28' then 'Centro de Distribución'
when ${TABLE}.centro='DA19' then 'Centro de Distribución'
when ${TABLE}.centro='AM01' then 'Centro de Distribución'
when ${TABLE}.centro='DA08' then 'Centro de Distribución'
when ${TABLE}.centro='DA13' then 'Centro de Distribución'
when ${TABLE}.centro='DA01' then 'Centro de Distribución'
when ${TABLE}.centro='DA02' then 'Centro de Distribución'
when ${TABLE}.centro='DN05' then 'Centro de Distribución'
when ${TABLE}.centro='DN18' then 'Centro de Distribución'
when ${TABLE}.centro='DN19' then 'Centro de Distribución'
when ${TABLE}.centro='DA20' then 'Centro de Distribución'
when ${TABLE}.centro='DR01' then 'Centro de Distribución'
when ${TABLE}.centro='PI19' then 'Planta'
when ${TABLE}.centro='PI13' then 'Planta'
when ${TABLE}.centro='DN08' then 'Centro de Distribución'
when ${TABLE}.centro='DA21' then 'Centro de Distribución'
when ${TABLE}.centro='DA22' then 'Centro de Distribución'
when ${TABLE}.centro='DE01' then 'Centro de Distribución'
when ${TABLE}.centro='PI05' then 'Planta'
when ${TABLE}.centro='DR20' then 'Centro de Distribución'
when ${TABLE}.centro='PI01' then 'Planta'
when ${TABLE}.centro='PG20' then 'Centro de Distribución' END ;;
  }

dimension: sku {
  type: string
  sql: ${TABLE}.SKU ;;
}

dimension: periodo_num {
  type: string
  sql: ${TABLE}.PeriodoNum ;;
}

dimension: periodo {
  type: string
  sql: ${TABLE}.Periodo ;;
}

dimension: precioventa {
  type: number
  sql: ${TABLE} END.precioventa ;;
}

dimension: costo {
  type: number
  sql: ${TABLE}.costo ;;
}

dimension: costo_absorbente {
  type: number
  sql: ${TABLE}.costo_absorbente ;;
}

dimension: cantidad {
  type: number
  sql: ${TABLE}.cantidad ;;
}






  measure: Total_importe_costo {
    label: "importe costo"
    type: sum
    sql: ${TABLE}.costo ;;
    value_format:"#,##0;(#,##0)"
  }

  measure: Total_importe_absorbente {
    label: "importe costo absorbente"
    type: sum
    sql: ${TABLE}.costo_absorbente ;;
    value_format:"#,##0;(#,##0)"
  }

  measure: Total_cantidad {
    label: "importe Cantidad"
    type: max
    sql: ${TABLE}.cantidad ;;
    value_format:"#,##0;(#,##0)"
  }


  measure: Total_PTTO {

    type: number
    # label:  "Stock"
    label_from_parameter: Tipo_Ptto
    sql:
    {% if Tipo_Ptto._parameter_value == 'Cantidad' %}
       ${Total_cantidad}

      {% elsif Tipo_Ptto._parameter_value == 'importe_Absorbente' %}
      ${Total_importe_absorbente}

      {% elsif Tipo_Ptto._parameter_value == 'Costo' %}
      ${Total_importe_costo}





      {% endif %};;
    # drill_fields: [almacen,material,material_desc,Total_Materiales,Total_stock_libre_utilizacion]
    value_format:"#,##0;(#,##0)"
  }

set: detail {
  fields: [
    tipomaterial,
    um,
    grupoarticulo,
    grupoarticuloexterno,
    claveidioma,
    articulodescribe,
    id_concepto,
    concepto,
    centro,
    sku,
    periodo_num,
    periodo,
    precioventa,
    costo,
    costo_absorbente,
    cantidad
  ]
}
}
