
view: res_vw_cadena_suministro_datos_generales {
  derived_table: {
    sql: with materiales as (
              select
              material,
              precio_estandar,
              precio_medio_variable,
              precio_absorbente ,
              centro,
              unidad_medida,
              plazo_entrega,
              tiempo_tratamiento_entrada_mercancias,
              indicador_control_precios /*s=standar, v=medio variable, a=absorbente ---No aplica--*/
    --  from psa-sga-dfn-qa.reporting_ecc_mx.                 vw_cadena_suministro_datos_generales
      from `eon-bus-proj-cadena-demo.data_foundation.reporting_homologacion_mx_vw_cadena_suministro_datos_generales`

      ),

      sociedades as (
                  SELECT sociedad,
                         almacen,
                         centro
                  FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_homologacion_mx_vw_cadena_suministro_almacenes`
                  WHERE sociedad in ('AMSA','PISA') group by 1,2,3)

                select m.*,s.sociedad from materiales m
                left join sociedades s on s.centro=m.centro  where s.centro is not null

      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: unidad_de_medida {
    type: string
    sql: ${TABLE}.unidad_medida ;;
  }

  dimension: plazo_de_entrega {
    type: number
    sql: ${TABLE}.plazo_entrega ;;
  }

  dimension: tiempo_tratamiento_entrada_mercancias {
    type: number
    sql: ${TABLE}.tiempo_tratamiento_entrada_mercancias ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: sociedad {
    type: string
    sql: ${TABLE}.sociedad ;;
  }



  dimension: sku {
    type: string
    sql: SUBSTR(${TABLE}.material,12,10) ;;
  }

  dimension: precio_estandar {
    type: number
    sql: ${TABLE}.precio_estandar ;;
  }

  dimension: precio_medio_variable {
    type: number
    sql: ${TABLE}.precio_medio_variable ;;
  }

  dimension: precio_absorbente {
    type: number
    sql: ${TABLE}.precio_absorbente ;;
  }


  measure: Total_precio_estandar {
    label: "Costo Estandar"
    type: max
    sql: ${TABLE}.precio_estandar ;;
  }

  measure: Total_precio_medio_variable {
    label: "Costo Medio Variable"
    type: max
    sql: ${TABLE}.precio_medio_variable ;;
  }

  measure: Total_precio_absorbente {
    label: "Costo Absorbente"
    type: max
    sql:case when ${TABLE}.precio_absorbente > 0 then ${TABLE}.precio_absorbente
             when ${TABLE}.precio_absorbente <= 0 and  ${TABLE}.precio_estandar > 0  then ${TABLE}.precio_estandar
             when ${TABLE}.precio_absorbente <= 0 and  ${TABLE}.precio_estandar <= 0  and  ${TABLE}.precio_medio_variable > 0  then ${TABLE}.precio_estandar else 0 end;;
    value_format:"$#.00;($#.00)"
  }




  dimension: indicador_control_precios {
    type: string
    sql: ${TABLE}.indicador_control_precios ;;
  }

  set: detail {
    fields: [
        material,
  precio_estandar,
  precio_medio_variable,
  precio_absorbente,
  indicador_control_precios
    ]
  }
}
