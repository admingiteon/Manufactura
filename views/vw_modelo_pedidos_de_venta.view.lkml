
view: vw_modelo_pedidos_de_venta {
  derived_table: {
    sql:
     select ROW_NUMBER() OVER() row_number    ,*  from (
    SELECT
                        vw_Pedidos.centro as centro,
                        vw_Pedidos.material as  sku,
                        vw_Pedidos.material,
                        vw_Pedidos.texto_breve as descibe_sku,
                        vw_Pedidos.grupo_articulos,
                        vw_Pedidos.org_ventas,
                        substr(vw_Pedidos.org_ventas,3,2) as mercado,
                        vw_Pedidos.solicitante as cliente,
                        clientes.clientes_rs,
                        vw_Pedidos.doc_ventas as nPedido,
                        max(vw_Pedidos.fecha_entrega) as ult_fecha,
                        sum(vw_Pedidos.cantidad_pedido) as Cantidad
                  FROM `psa-sga-dfn-qa.reporting_ecc_mx.vw_cadena_suministro_pedidos_venta`  as vw_Pedidos
             
                  left outer join
                        (
                        select elcliente.codigo_cliente as cliente_id,
                              elcliente.nombre as clientes_rs
                        from psa-sga-dfn-qa.reporting_ecc_mx.vw_cadena_suministro_datos_generales_cliente as elcliente
                        ) as clientes  on   clientes.cliente_id=vw_Pedidos.solicitante
                  where  substring(material,12,2)='40'
                  and  estatus_entrega<>'C' /* Diferente de completamente tratado*/
                  and (DATE(fecha_entrega) >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 year ) --- 02 YEAR---
                         and DATE(fecha_entrega) <= DATE_SUB(CURRENT_DATE(), INTERVAL -12 Week))
                  and sector='PT' /*Producto terminado*/
                 /* and length(vw_Pedidos.motivo_rechazo)=0 /*Comentar y cambiar línea de código por valores incluidos */
                  and motivo_rechazo IN ('1', '11', '25', '28', '30', '31', '91','')
               and  vw_Pedidos.material in ( select material from `psa-psa-cadena-qa.reporting_ecc_mx.vw_consolidado_codigos_sku`)

                  group by 1,2,3,4,5,6,7,8,9,10) a

      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }


  dimension: row_number {
    primary_key: yes
    type: number
    sql: ${TABLE}.row_number ;;
  }

  dimension: Material {
    type: string
    sql: ${TABLE}.material ;;
  }


  dimension: sku {
    type: string
    sql: SUBSTR(${TABLE}.sku,12,10) ;;
  }

  dimension: descibe_sku {
    type: string
    sql: ${TABLE}.descibe_sku ;;
  }

  dimension: grupo_articulos {
    type: string
    sql: ${TABLE}.grupo_articulos ;;
  }

  dimension: org_ventas {
    type: string
    sql: ${TABLE}.org_ventas ;;
  }

  dimension: mercado {
    type: string
    sql: ${TABLE}.mercado ;;
  }

  dimension: cliente {
    type: string
    sql: ${TABLE}.cliente ;;
  }

  dimension: clientes_rs {
    type: string
    sql: ${TABLE}.clientes_rs ;;
  }

  dimension: n_pedido {
    type: string
    sql: ${TABLE}.nPedido ;;
  }

  dimension: ult_fecha {
    type: date
    datatype: date
    sql: ${TABLE}.ult_fecha ;;
  }


  dimension_group: Fecha {
    type: time

    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: cast(${TABLE}.ult_fecha AS TIMESTAMP) ;;
    convert_tz: no
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }


  measure: Total_cantidad {
    type: sum
    sql: ${TABLE}.Cantidad ;;
  }

  set: detail {
    fields: [
        centro,
  sku,
  descibe_sku,
  grupo_articulos,
  org_ventas,
  mercado,
  cliente,
  clientes_rs,
  n_pedido,
  ult_fecha,
  cantidad
    ]
  }
}
