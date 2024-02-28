
view: vw_largo_plazo_calmacenamiento {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.tb_largo_plazo_calmacenamiento`

    where planta like 'PI%' OR planta like 'AM%' and centro in ('DA11',
'DR08',
'PI15',
'PI11',
'DR13',
'DN01',
'PI06',
'DR21',
'DR17',
'PI12',
'DR10',
'DN11',
'DR16',
'DR15',
'PI14',
'AI01',
'PI08',
'PI10',
'PT01',
'DA09',
'DA03',
'DA28',
'DA19',
'AM01',
'DA08',
'DA13',
'DA01',
'DA02',
'DN05',
'DN18',
'DN19',
'DA20',
'DR01',
'PI19',
'PI13',
'DN08',
'DA21',
'DA22',
'DE01',
'PI05',
'DR20',
'PI01',
'PG20'
) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_concepto {
    type: number
    sql: ${TABLE}.id_concepto ;;
  }

  dimension: concepto {
    type: string
    sql: ${TABLE}.concepto ;;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.planta ;;
  }

  dimension: describeplanta {
    type: string
    sql: ${TABLE}.describeplanta ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: periodo_num {
    type: string
    sql: ${TABLE}.PeriodoNum ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.periodo ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.cantidad ;;
  }

  measure: Total_cantidad {
    type: sum
    sql: ${TABLE}.cantidad ;;
  }

  set: detail {
    fields: [
        id_concepto,
  concepto,
  planta,
  describeplanta,
  sku,
  periodo_num,
  periodo,
  cantidad
    ]
  }
}
