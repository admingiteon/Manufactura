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
explore: res_vw_cadena_suministro_datos_generales {}

explore: vw_consolidado_codigos_sku {}
explore: res_forecast_completo_cp {}
explore: res_tb_sku_componentes {}
explore: res_tb_sku_componentes_uni {}
explore: res_tb_sku_componentes_vertical {}


explore: salida_cp_insumo_compras_1 {}
explore: salida_cp_insumo_inventario_1 {}
explore: salida_cp_pt_inventario_lu_1 {}
explore: salida_modelo_de_calculo_fabricacion_cp {}
explore: salida_cp_pt_fabricacion_1 {}
explore: salida_cp_pt_comprados_inventario_lu_1 {}

explore: salidas_lp_fabricacion {}


explore: salidas_lp_insumo_compras_1 {

  join: res_vw_cadena_suministro_datos_generales  {
    type: left_outer
    sql_on: ${salidas_lp_insumo_compras_1.Material} = ${res_vw_cadena_suministro_datos_generales.material}
    AND ${salidas_lp_insumo_compras_1.Centro} = ${res_vw_cadena_suministro_datos_generales.centro};;
    relationship: many_to_one
  }

  join: salidas_lp_insumo_inventario_1  {
    type: left_outer
    sql_on: ${salidas_lp_insumo_compras_1.Material} = ${salidas_lp_insumo_inventario_1.Material}
      AND ${salidas_lp_insumo_compras_1.Centro} = ${salidas_lp_insumo_inventario_1.Centro};;
    relationship: many_to_one
  }

}


explore: salidas_lp_insumo_inventario_1 {}
explore: salidas_lp_pt_fabricacion_1 {}
explore: salidas_lp_pt_inventario_lu_1 {}

explore: alm_lp_pt_almacenamiento {}
explore: alm_cp_pt_almacenamiento {}
explore: salida_lp_Forecast_Completo_LP {}


explore: pv_forecast_completo_lp {}
explore: pv_lp_insumo_inventario_1 {}
explore: pv_lp_pt_comprados_inventario_lu_1 {}
explore: pv_lp_pt_fabricados_inventario_lu_1 {}

explore: tb_corto_plazo_trazabilidad {}
explore: tb_corto_plazo_fabricacion {}

explore: arima_medicion_lp {}


explore: arima_forecast_completo_lp_2 {

  join: arima_medicion_lp  {
    type: left_outer
    #sql_on: ${entradas_y_salidas_forecast_completo_v2.id} = ${mediciones_forecast_v2.id} ;;
    sql_on: ${arima_forecast_completo_lp_2.id} = ${arima_medicion_lp.id} ;;

    relationship: many_to_one
  }

  join: val_vw_datos_generales  {
    type: left_outer
    sql_on: ${val_vw_datos_generales.material} = SUBSTR(${arima_forecast_completo_lp_2.id},1,18) ;;
    relationship: many_to_one
  }
}

explore: tb_corto_plazo_plansuministro {}
explore: tb_corto_plazo_planentregas {}
explore: alm_pt_almacenamiento_sim {}

explore: tb_largo_plazo_trazabilidad_nv {}
explore: tb_largo_plazo_presupuesto_nv {}
