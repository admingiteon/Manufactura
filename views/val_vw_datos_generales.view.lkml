#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines



view: val_vw_datos_generales {
  dimension: msteriales {
    drill_fields: [num_reserva]
  }
  derived_table: {
    sql: SELECT *,'0' as pos_reserva,
                  '0' as num_reserva,
                  '0' as salidad_final,
                  '0' as pos_borrada,
                  '//' as fecha_necesidad,
                  0 as cantidad_necesaria_tot,
                  '?' as unidad_medida_resb,
                  0 as cantidad_tomada_tot
          FROM `psa-sga-dfn-qa.reporting_ecc_mx.vw_cadena_suministro_datos_generales`
          where grupo_articulos in  ('AM',
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
'VDD')  ;;
  }


  measure: count {
    type: count_distinct
    sql: ${num_reserva} ;;
    drill_fields: [material]
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
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

  dimension: material_desc{
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

  measure: total_stock_traslado {
    type: sum
    sql: ${stock_traslado} ;;
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

  dimension: num_reserva {
    type: string
    sql: ${TABLE}.num_reserva ;;
  }

  dimension: pos_reserva {
    type: string
    sql: ${TABLE}.pos_reserva ;;
  }

  dimension: salidad_final {
    type: string
    sql: ${TABLE}.salidad_final ;;
  }

  dimension: pos_borrada {
    type: string
    sql: ${TABLE}.pos_borrada ;;
  }

  dimension: fecha_necesidad {
    type: date
    datatype: date
    sql: ${TABLE}.fecha_necesidad ;;
  }

  dimension: cantidad_necesaria_tot {
    type: number
    sql: ${TABLE}.cantidad_necesaria_tot ;;
  }

  dimension: unidad_medida_resb {
    type: string
    sql: ${TABLE}.unidad_medida_resb ;;
  }

  dimension: cantidad_tomada_tot {
    type: number
    sql: ${TABLE}.cantidad_tomada_tot ;;
  }


  measure: Registros {
    type: count
    drill_fields: [detail*]

  }

  measure: Total_stock_libre_utilizacion {
    type: sum
    sql: ${stock_libre_utilizacion} ;;
    drill_fields: [almacen,material,material_desc,Total_Materiales,Total_stock_libre_utilizacion]
  }



  measure: Total_Materiales{
    label: "Numero SKU"
    type: count_distinct
    sql:${material};;
    drill_fields: [almacen,material,material_desc,Total_Materiales,Total_stock_libre_utilizacion]
  }

  measure: Total_centros{
    type: count_distinct
    sql:${centro} ;;
    drill_fields: [almacen,material,Total_Materiales,Total_stock_libre_utilizacion]
  }

  measure: Total_almacenes{
    type: count_distinct
    sql:${almacen} ;;
    drill_fields: [almacen,material,Total_Materiales,Total_stock_libre_utilizacion]
  }

  measure: Total_Sin_inventario{
    label: "SKU sin invenrario"
    type: count_distinct
    sql:${material};;
    filters: [stock_libre_utilizacion: ">0"]
    drill_fields: [almacen,material,material_desc,Total_Materiales,Total_stock_libre_utilizacion]
  }

  measure: Total_inventario{
    label: "SKU  invenrario"
    sql:${Total_Materiales}-${Total_Sin_inventario};;
    drill_fields: [almacen,material,Total_Materiales,Total_stock_libre_utilizacion]

  }

  dimension: Metaria_descripcion {
    type: string
    sql: CONCAT(${material}, "-" , ${material_desc})  ;;
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
      denominador_conversion_unidad_medida_base,
      num_reserva,
      pos_reserva,
      salidad_final,
      pos_borrada,
      fecha_necesidad,
      cantidad_necesaria_tot,
      unidad_medida_resb,
      cantidad_tomada_tot
    ]
  }
}
