
view: res_vw_lp_inventario_insumos {
  derived_table: {
   # sql: SELECT i.*,ROW_NUMBER() OVER() row_number,m.texto_breve_material Insumo_material_Descripcion  FROM `psa-psa-cadena-qa.reporting_ecc_mx.tb_lp_inventario_insumos` i
  #  left join (select material,texto_breve_material from `psa-sga-dfn-qa.reporting_ecc_mx.vw_cadena_suministro_datos_generales` group by material,texto_breve_material)  m on i.Insumo_material = m.material
  #  where  i.material in (select material from `psa-psa-cadena-qa.reporting_ecc_mx.vw_consolidado_codigos_sku`)

    sql: with

primer_periodo
as (

select
min(fechas.fecha)
as Fecha
FROM
psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Inventario_LU_1
 as fechas
),

Inventario_inicial
as (
SELECT
primer_periodo.fecha
As periodo,
    substring(Inventarios.id,20,4)
as centro,
    substring(Inventarios.id,1,18)
as sku,
    sum(Inventarios.posicion_actual
) as
cantidad,
     sum(Inventarios.stock_control_calidad)
as cantidad_calidad,
    max(
Inventarios.stock_seguridad)
as stock_seguridad
FROM
   primer_periodo,
      psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Inventario_LU_1
 as  Inventarios

where
  Inventarios.fecha=primer_periodo.fecha

group
by 1,2,3
),

material
as (SELECT
material, texto_breve_material
FROM
(
SELECT
*, ROW_NUMBER
( )

  OVER (
 PARTITION BY
material)
as RN
FROM
 psa-sga-dfn-qa.reporting_ecc_mx.vw_cadena_suministro_datos_generales)
D WHERE
RN = 1)

Select
i.*
,i.sku material
,M.texto_breve_material

 from inventario_inicial
i

 left join
material M
on M.material=i.sku ;;







  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: row_number {
    primary_key: yes
    type: number
    sql: ${TABLE}.row_number ;;
  }



  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: insumo_material {
    type: string
    sql: SUBSTR(${TABLE}.Insumo_material,12,10) ;;
  }

  dimension: Insumo_material_Descripcion {
    type: string
    sql: ${TABLE}.Insumo_material_Descripcion ;;
  }

  dimension: sku {
    type: string
    sql: SUBSTR(${TABLE}.material,12,10) ;;
  }

  dimension: stock_libre_utilizacion {
    type: number
    sql: ${TABLE}.cantidad ;;
  }

  dimension: stock_seguridad {
    type: number
    sql: ${TABLE}.stock_seguridad ;;
  }



  dimension: insumo_stock_libre_utilizacion {
    type: number
    sql: ${TABLE}.insumo_stock_libre_utilizacion ;;
  }

  dimension: insumo_stock_seguridad {
    type: number
    sql: ${TABLE}.insumo_stock_seguridad ;;
  }

  dimension: Stock_QA {
    type: number
    sql: ${TABLE}.cantidad_calidad ;;
  }

  measure: Total_Stock_QA {
    label: "Stock_QA"
    type: max
    sql: ${TABLE}.cantidad_calidad ;;
  }


  measure: Total_stock_libre_utilizacion {
    label: "stock_libre_utilizacion"
    type: max
    sql: ${TABLE}.cantidad ;;
  }

  measure: Total_stock_seguridad {
    label: "stock_seguridad"
    type: max
    sql: ${TABLE}.stock_seguridad ;;
  }


  measure: Total_stock {
    label: "Total_stock"
    type: number
    sql: ${Total_stock_seguridad}+${Total_stock_libre_utilizacion} ;;
  }






  measure: Total_insumo_stock_libre_utilizacion {
    label: "insumo_stock_libre_utilizacion"
    type: sum
    sql: ${TABLE}.insumo_stock_libre_utilizacion ;;
  }

  measure: Total_insumo_stock_seguridad {
    label: "insumo_stock_seguridad"
    type: sum
    sql: ${TABLE}.insumo_stock_seguridad ;;
  }


  measure: Total_insumos {
    label: "Total_insumos"
    type: number
    sql: ${Total_insumo_stock_libre_utilizacion}+${Total_insumo_stock_seguridad} ;;
  }


  set: detail {
    fields: [

  centro,
  material,
  stock_libre_utilizacion,
  stock_seguridad,
  insumo_material,
  insumo_stock_libre_utilizacion,
  insumo_stock_seguridad
    ]
  }
}
