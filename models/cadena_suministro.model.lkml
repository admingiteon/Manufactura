connection: "hypson"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: cadena_suministro_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cadena_suministro_default_datagroup

explore: vw_cadena_suministro_pedidos_venta {}

explore: ejercicio1 {}

explore: pe_cad_sum_dat_gen {} #Para tablero Plan de entrega corto plazo
explore: val_vw_cad_sum_alm {} #Para validar la vista de Cadena de suministro almacenes
explore: val_vw_datos_generales {

  join: demanda_calculos {
    type: left_outer
    sql_on: ${val_vw_datos_generales.material} = ${demanda_calculos.sku} ;;
    relationship: many_to_one
  }
} #Para validar la vista de Cadena de datos Generales
explore: val_vw_ordenes_compra {} #Para validar la vista de Ordenes de Compra
explore: lista_materiales_datos_generales {}
explore: val_vw_recetas_fabricacion{} #Para validarrecetas de fabricación
explore: vw_catalogo_materiales {}
explore: val_vw_datos_inspeccion {}
explore: val_vw_ordenes_proceso {}
explore: val_vw_pedidos_ventas {}
explore: val_vw_recursos_capacidades {}
explore: val_largo_plazo_completo_aruma {}
explore: vw_largo_plazo_trazabilidad {
  join: vw_lista_componentes {
    type: left_outer
    sql_on: ${vw_largo_plazo_trazabilidad.sku} = ${vw_lista_componentes.sku} ;;
    relationship: many_to_one
  }
  join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${vw_largo_plazo_trazabilidad.sku} = ${val_vw_datos_generales.material} ;;
    relationship: many_to_one
  }
}

explore: vw_lista_componentes {}
explore: demanda_calculos {}
explore: vw_largo_plazo_trazabilidad_drill {}
explore: vw_largo_plazo_presupuesto {}
