
view: cp_borrar {
  derived_table: {
    sql: select * from (
      select * from psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_trazabilidad
      union all
      select  1 id_concepto,  
              1 orden_concepto,
              'PRONÓSTICO DE PEDIDOS' concepto,
              Centro,
              SKU,
              Describe_sku,
              grupo_articulos,
               org_ventas,
              mercado,
              cliente,
              clientes_rs,
              '2022-12-25' dSemana,  
              nPedido,
              0 cantidad,
              0 demanda,
              0 inventaini,
              0 stockdeseguridad
       from psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_trazabilidad  where concepto  not in ('1','2') group by 
       Centro,
              SKU,
              Describe_sku,
              grupo_articulos,
                Centro,
              SKU,
              Describe_sku,
              grupo_articulos,
              org_ventas,
              mercado,
              cliente,
              clientes_rs,   
              nPedido
      
       union all 
      
       select  2 id_concepto,  
               2 orden_concepto,
              'PEDIDOS ABIERTOS' concepto,
              Centro,
              SKU,
              Describe_sku,
              grupo_articulos,
               org_ventas,
              mercado,
              cliente,
              clientes_rs,
              '2022-12-25' dSemana,  
              nPedido,
              0 cantidad,
              0 demanda,
              0 inventaini,
              0 stockdeseguridad
       from psa-psa-cadena-qa.reporting_ecc_mx.tb_corto_plazo_trazabilidad  where concepto  not in ('1','2') group by 
       Centro,
              SKU,
              Describe_sku,
              grupo_articulos,
                Centro,
              SKU,
              Describe_sku,
              grupo_articulos,
              org_ventas,
              mercado,
              cliente,
              clientes_rs,   
              nPedido
      ) a limit 100 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_concepto {
    type: number
    sql: ${TABLE}.id_concepto ;;
  }

  dimension: orden_concepto {
    type: number
    sql: ${TABLE}.orden_concepto ;;
  }

  dimension: concepto {
    type: string
    sql: ${TABLE}.concepto ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.Centro ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  dimension: describe_sku {
    type: string
    sql: ${TABLE}.Describe_sku ;;
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

  dimension: d_semana {
    type: date
    datatype: date
    sql: ${TABLE}.dSemana ;;
  }

  dimension: n_pedido {
    type: string
    sql: ${TABLE}.nPedido ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.cantidad ;;
  }

  dimension: demanda {
    type: number
    sql: ${TABLE}.demanda ;;
  }

  dimension: inventaini {
    type: number
    sql: ${TABLE}.inventaini ;;
  }

  dimension: stockdeseguridad {
    type: number
    sql: ${TABLE}.stockdeseguridad ;;
  }

  set: detail {
    fields: [
        id_concepto,
	orden_concepto,
	concepto,
	centro,
	sku,
	describe_sku,
	grupo_articulos,
	org_ventas,
	mercado,
	cliente,
	clientes_rs,
	d_semana,
	n_pedido,
	cantidad,
	demanda,
	inventaini,
	stockdeseguridad
    ]
  }
}
