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
explore: vw_largo_plazo_presupuesto {

  join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${val_vw_datos_generales.material} = ${vw_largo_plazo_presupuesto.sku} ;;
    relationship: many_to_one
  }


}


explore: vw_largo_plazo_calmacenamiento {

  join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${val_vw_datos_generales.material} = ${vw_largo_plazo_calmacenamiento.sku} ;;
    relationship: many_to_one
  }
}


explore: entradas_y_salidas_forecast_completo_v2 {

  join: mediciones_forecast_v2  {
    type: left_outer
    #sql_on: ${entradas_y_salidas_forecast_completo_v2.id} = ${mediciones_forecast_v2.id} ;;
    sql_on: ${entradas_y_salidas_forecast_completo_v2.id} = ${mediciones_forecast_v2.id} ;;

    relationship: many_to_one
  }

  join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${val_vw_datos_generales.material} = SUBSTR(${entradas_y_salidas_forecast_completo_v2.id},1,18) ;;
    relationship: many_to_one
  }

}



explore: forecast_completo_cp{

  join: mediciones_forecast_cp  {
    type: left_outer
    #sql_on: ${entradas_y_salidas_forecast_completo_v2.id} = ${mediciones_forecast_v2.id} ;;
    sql_on: ${forecast_completo_cp.id} = ${mediciones_forecast_cp.id} ;;

    relationship: many_to_one
  }

  join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${val_vw_datos_generales.material} = SUBSTR(${forecast_completo_cp.id},1,18) ;;
    relationship: many_to_one
  }

}
explore: mediciones_forecast_cp {}









explore: datos_idp {
  join: mediciones_forecast  {
    type: left_outer
    sql_on: ${datos_idp.id} = ${mediciones_forecast.id} ;;
    relationship: many_to_one
  }

  join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${val_vw_datos_generales.material} = SUBSTR(${datos_idp.id},1,18) ;;
    relationship: many_to_one
  }

}
explore: mediciones_forecast {}

explore: vw_largo_plazo_cfabricacion {

  join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${val_vw_datos_generales.material} = ${vw_largo_plazo_cfabricacion.sku} ;;
    relationship: many_to_one
  }
}

explore: res_vw_lp_pedidos_de_ventas {



   join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${res_vw_lp_pedidos_de_ventas.material}=${val_vw_datos_generales.material} ;;
    relationship: many_to_one
  }



}


explore: res_forecast_completo_cp_ {

  join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${val_vw_datos_generales.material} = ${res_forecast_completo_cp_.material} ;;
    relationship: many_to_one
  }

}
explore: res_vw_cp_forecast_completo {
  join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${val_vw_datos_generales.material} = ${res_vw_cp_forecast_completo.material} ;;
    relationship: many_to_one
  }
}
explore: res_vw_lp_productos_terminados {}
explore: res_vw_lp_precio_unitario {}

explore: res_vw_lp_inventario_insumos {

  join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${res_vw_lp_inventario_insumos.material} = ${val_vw_datos_generales.material} ;;
    relationship: many_to_one
  }
}
explore: res_vw_lp_ibp_planeacion_demanda {}
explore: vw_modelo_pedidos_de_venta {}


explore: vw_consolidado_codigos_sku {}
