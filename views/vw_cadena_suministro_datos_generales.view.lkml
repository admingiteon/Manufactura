
view: vw_cadena_suministro_datos_generales {
  derived_table: {
    #sql: select * from `eon-bus-proj-cadena-demo.p_reporting_homologacion_mx.vw_cadena_suministro_datos_generales` limit 1000 ;;
    sql: select * from `eon-bus-proj-cadena-demo.data_foundation.reporting_homologacion_mx_vw_cadena_suministro_datos_generales`;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  measure: number_of_unique_material {
    type: count_distinct
    sql: ${material} ;;
  }

  dimension: tipo_material {
    type: string
    sql: ${TABLE}.tipo_material ;;
  }

  dimension: unidad_medida {
    type: string
    sql: ${TABLE}.unidad_medida ;;
  }

  dimension: grupo_articulos {
    type: string
    sql: ${TABLE}.grupo_articulos ;;
  }

  dimension: grupo_articulos_externos {
    type: string
    sql: ${TABLE}.grupo_articulos_externos ;;
  }

  dimension: texto_breve_material {
    type: string
    sql: ${TABLE}.texto_breve_material ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: caract_plan_necesidades {
    type: string
    sql: ${TABLE}.caract_plan_necesidades ;;
  }

  dimension: punto_pedido {
    type: number
    sql: ${TABLE}.punto_pedido ;;
  }

  dimension: tamano_lote_min {
    type: number
    sql: ${TABLE}.tamano_lote_min ;;
  }

  dimension: plazo_entrega {
    type: number
    sql: ${TABLE}.plazo_entrega ;;
  }

  dimension: stock_seguridad {
    type: number
    sql: ${TABLE}.stock_seguridad ;;
  }

  dimension: stock_seguridad_min {
    type: number
    sql: ${TABLE}.stock_seguridad_min ;;
  }

  dimension: tiempo_tratamiento_entrada_mercancias {
    type: number
    sql: ${TABLE}.tiempo_tratamiento_entrada_mercancias ;;
  }

  dimension: valor_redond {
    type: number
    sql: ${TABLE}.valor_redond ;;
  }

  dimension: tamano_lote_max {
    type: number
    sql: ${TABLE}.tamano_lote_max ;;
  }

  dimension: responsable_control_prod {
    type: string
    sql: ${TABLE}.responsable_control_prod ;;
  }

  dimension: tamano_lote_fijo {
    type: number
    sql: ${TABLE}.tamano_lote_fijo ;;
  }

  dimension: clase_aprovisionamiento {
    type: string
    sql: ${TABLE}.clase_aprovisionamiento ;;
  }

  dimension: indicador_control_precios {
    type: string
    sql: ${TABLE}.indicador_control_precios ;;
  }

  dimension: precio_medio_variable {
    type: number
    sql: ${TABLE}.precio_medio_variable ;;
  }

  dimension: precio_estandar {
    type: number
    sql: ${TABLE}.precio_estandar ;;
  }

  dimension: cantidad_base {
    type: number
    sql: ${TABLE}.cantidad_base ;;
  }

  dimension: precio_absorbente {
    type: number
    sql: ${TABLE}.precio_absorbente ;;
  }

  dimension: almacen {
    type: string
    sql: ${TABLE}.almacen ;;
  }

  dimension: stock_libre_utilizacion {
    type: number
    sql: ${TABLE}.stock_libre_utilizacion ;;
  }

  dimension: stock_traslado {
    type: number
    sql: ${TABLE}.stock_traslado ;;
  }

  dimension: stock_control_calidad {
    type: number
    sql: ${TABLE}.stock_control_calidad ;;
  }

  dimension: stock_bloqueado {
    type: number
    sql: ${TABLE}.stock_bloqueado ;;
  }

  dimension: contador_conversion_unidad_medida_base {
    type: number
    sql: ${TABLE}.contador_conversion_unidad_medida_base ;;
  }

  dimension: denominador_conversion_unidad_medida_base {
    type: number
    sql: ${TABLE}.denominador_conversion_unidad_medida_base ;;
  }

  set: detail {
    fields: [
        material,
  tipo_material,
  unidad_medida,
  grupo_articulos,
  grupo_articulos_externos,
  texto_breve_material,
  centro,
  caract_plan_necesidades,
  punto_pedido,
  tamano_lote_min,
  plazo_entrega,
  stock_seguridad,
  stock_seguridad_min,
  tiempo_tratamiento_entrada_mercancias,
  valor_redond,
  tamano_lote_max,
  responsable_control_prod,
  tamano_lote_fijo,
  clase_aprovisionamiento,
  indicador_control_precios,
  precio_medio_variable,
  precio_estandar,
  cantidad_base,
  precio_absorbente,
  almacen,
  stock_libre_utilizacion,
  stock_traslado,
  stock_control_calidad,
  stock_bloqueado,
  contador_conversion_unidad_medida_base,
  denominador_conversion_unidad_medida_base
    ]
  }
}
