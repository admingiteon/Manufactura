
view: res_vw_lp_inventario_insumos {
  derived_table: {
    sql: SELECT i.*,ROW_NUMBER() OVER() row_number,m.texto_breve_material Insumo_material_Descripcion  FROM `psa-psa-cadena-qa.reporting_ecc_mx.tb_lp_inventario_insumos` i
    left join (select material,texto_breve_material from `psa-sga-dfn-qa.reporting_ecc_mx.vw_cadena_suministro_datos_generales` group by material,texto_breve_material)  m on i.Insumo_material = m.material
    where  i.material in (select material from `psa-psa-cadena-qa.reporting_ecc_mx.vw_consolidado_codigos_sku`)
    ;;
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

  dimension: sociedad {
    type: string
    sql: ${TABLE}.sociedad ;;
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
    sql: ${TABLE}.stock_libre_utilizacion ;;
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


  measure: Total_stock_libre_utilizacion {
    label: "stock_libre_utilizacion"
    type: sum
    sql: ${TABLE}.stock_libre_utilizacion ;;
  }

  measure: Total_stock_seguridad {
    label: "stock_seguridad"
    type: sum
    sql: ${TABLE}.stock_seguridad ;;
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

  set: detail {
    fields: [
        sociedad,
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
