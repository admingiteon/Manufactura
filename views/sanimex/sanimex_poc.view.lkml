view: sanimex_poc {

  derived_table: {
    sql: SELECT main.*,lat_long.latitud,lat_long.longitud FROM
`eon-bus-proj-cadena-demo.eon_training.sanimex_poc` as main
LEFT JOIN `eon-bus-proj-cadena-demo.eon_training.lat_long_sanimex` as lat_long
 ON main.colonia=lat_long.Colonia and  lat_long.cp=main.cp
;;


  }

  dimension: longitud {
    type: string
    sql: ${TABLE}.longitud ;;
  }

  dimension: latitud {
    type: string
    sql: ${TABLE}.latitud ;;
  }

  dimension: map {
    type: location
    sql_latitude:${latitud} ;;
    sql_longitude:${longitud} ;;
  }


  dimension: anio {
    type: number
    sql: ${TABLE}.anio ;;
  }

  measure: total_anio {
    type: sum
    sql: ${anio} ;;  }
  measure: average_anio {
    type: average
    sql: ${anio} ;;  }

  dimension: cajero {
    type: number
    sql: ${TABLE}.cajero ;;
  }

  dimension: colonia {
    type: string
    sql: ${TABLE}.colonia ;;
  }

  dimension: cp {
    type: number
    sql: ${TABLE}.cp ;;
  }

  dimension: ctd_venta {
    type: number
    sql: ${TABLE}.ctd_venta ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha_contab {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha_contab ;;
  }

  dimension: id_articulo {
    type: string
    sql: ${TABLE}.id_articulo ;;
  }

  dimension: mes_anio {
    type: number
    sql: ${TABLE}.mes_anio ;;
  }

  dimension: metros_pzas {
    type: number
    sql: ${TABLE}.metros_pzas ;;
  }

  dimension: municipio {
    type: string
    sql: ${TABLE}.municipio ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.nombre ;;
  }

  dimension: nombre_articulo {
    type: string
    sql: ${TABLE}.nombre_articulo ;;
  }

  dimension: numero_transaccion {
    type: string
    sql: ${TABLE}.numero_transaccion ;;
  }

  dimension: r2 {
    type: string
    sql: ${TABLE}.R2 ;;
  }

  dimension: r3 {
    type: string
    sql: ${TABLE}.R3 ;;
  }

  dimension: r4 {
    type: string
    sql: ${TABLE}.R4 ;;
  }

  dimension: rango {
    type: string
    sql: ${TABLE}.Rango ;;
  }

  dimension: ruta_recoge {
    type: string
    sql: ${TABLE}.ruta_recoge ;;
  }

  dimension: sucursal {
    type: string
    sql: ${TABLE}.sucursal ;;
  }

  dimension: tienda {
    type: string
    sql: ${TABLE}.tienda ;;
  }

  dimension: unidad {
    type: string
    sql: ${TABLE}.unidad ;;
  }

  dimension: unidad_e {
    type: number
    sql: ${TABLE}.unidad_e ;;
  }

  measure: valor_de_venta {
    type: sum
    sql: ${TABLE}.valor_de_venta ;;
  }

  measure: venta_sin_iva {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.venta_sin_iva ;;
  }

  measure: suma_ventas_sin_iva_1p {
    type: sum
    sql: CASE WHEN ${TABLE}.Rango = '1P' THEN ${TABLE}.venta_sin_iva ELSE 0 END ;;
    label: "Suma Ventas Sin IVA 1P"
    value_format: "#,##0"
  }

  measure: suma_ventas_sin_iva_2p {
    type: sum
    sql: CASE WHEN ${TABLE}.Rango = '2P' THEN ${TABLE}.venta_sin_iva ELSE 0 END ;;
    label: "Suma Ventas Sin IVA 2P"
    value_format: "#,##0"
  }


  dimension: zona {
    type: string
    sql: ${TABLE}.zona ;;
  }
  measure: count {
    type: count
  }
}
