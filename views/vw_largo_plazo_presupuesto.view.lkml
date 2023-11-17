
view: vw_largo_plazo_presupuesto {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.tb_largo_plazo_presupuesto`  where  grupoarticulo in  ('AM',
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
'VDD')    and centro in ('DA11',
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
);;
  }


  parameter: Tipo_Ptto {
    label: "Tipo Ptro"
    type: unquoted



    allowed_value: {
      label: "Costo"
      value: "Costo"
    }

    allowed_value: {
      label: "Cantidad"
      value: "Cantidad"
    }


    allowed_value: {
      label: "Importe Absorbente"
      value: "importe_Absorbente"
    }

  }


measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: tipomaterial {
  type: string
  sql: ${TABLE}.tipomaterial ;;
}

dimension: um {
  type: string
  sql: ${TABLE}.um ;;
}

#dimension: grupoarticulo {
 # type: string
  #sql: ${TABLE}.grupoarticulo ;;
#}

  dimension: grupoarticulo {
    type: string
    sql: case when  ${TABLE}.grupoarticulo = 'AM' then 'AMSA'
              when  ${TABLE}.grupoarticulo = 'A' then 'Anestesiología y Terapia Intensiva'
              when  ${TABLE}.grupoarticulo = 'T' then 'Antibióticos Intra-Hospitalarios'
              when  ${TABLE}.grupoarticulo = 'O' then 'Antibióticos de Prescripción'
              when ${TABLE}.grupoarticulo = 'L' then 'Control de Infecciones'
              when ${TABLE}.grupoarticulo = 'E' then 'Diálisis Peritoneal'
              when ${TABLE}.grupoarticulo = 'G' then 'Enfermedades Crónicas'
              when ${TABLE}.grupoarticulo = 'K' then 'Farmacéuticos OTC'
              when ${TABLE}.grupoarticulo = 'GP' then 'GENEPISA'
               when ${TABLE}.grupoarticulo = 'J' then 'Hemodiálisis'
      when ${TABLE}.grupoarticulo = 'MI' then 'Maquila Intl.'
      when ${TABLE}.grupoarticulo = 'M' then 'Maquila Nacional'
      when ${TABLE}.grupoarticulo = 'MP' then 'Marca Propia'
      when ${TABLE}.grupoarticulo = 'S' then 'NEUROLOGÍA y PSIQUIATRÍA'
      when ${TABLE}.grupoarticulo = 'F' then 'Nutrición'
      when ${TABLE}.grupoarticulo = 'D' then 'Oftalmología'
      when ${TABLE}.grupoarticulo = 'H' then 'Oncológicos'
      when ${TABLE}.grupoarticulo = 'Q' then 'Pediatría'
      when ${TABLE}.grupoarticulo = 'PMD' then 'Productos Medimix'
      when ${TABLE}.grupoarticulo = 'SM' then 'Salucom'
      when ${TABLE}.grupoarticulo = 'B' then 'Terapia de Infusión'
      when ${TABLE}.grupoarticulo = 'R' then 'Terapia del dolor'
      when ${TABLE}.grupoarticulo = 'N' then 'Transplantes'
      when ${TABLE}.grupoarticulo = 'VDD' then 'Venta Directa Dimesa'
      when ${TABLE}.grupoarticulo = 'U' then 'Genéricos'
      else ${TABLE}.grupoarticulo END  ;;
  }


dimension: grupoarticuloexterno {
  type: string
  sql: ${TABLE}.grupoarticuloexterno ;;
}

dimension: claveidioma {
  type: string
  sql: ${TABLE}.claveidioma ;;
}

dimension: articulodescribe {
  type: string
  sql: ${TABLE}.articulodescribe ;;
}

dimension: id_concepto {
  type: number
  sql: ${TABLE}.id_Concepto ;;
}

dimension: concepto {
  type: string
  sql: ${TABLE}.Concepto ;;
}

dimension: centro {
  type: string
  sql: ${TABLE}.centro ;;
}



  dimension: planta {
    type: string
    sql: case when ${TABLE}.centro='DA11' then 'Centro de Distribución'
when ${TABLE}.centro='DR08' then 'Centro de Distribución'
when ${TABLE}.centro='PI15' then 'Planta'
when ${TABLE}.centro='PI11' then 'Planta'
when ${TABLE}.centro='DR13' then 'Centro de Distribución'
when ${TABLE}.centro='DN01' then 'Centro de Distribución'
when ${TABLE}.centro='PI06' then 'Planta'
when ${TABLE}.centro='DR21' then 'Centro de Distribución'
when ${TABLE}.centro='DR17' then 'Centro de Distribución'
when ${TABLE}.centro='PI12' then 'Planta'
when ${TABLE}.centro='DR10' then 'Centro de Distribución'
when ${TABLE}.centro='DN11' then 'Centro de Distribución'
when ${TABLE}.centro='DR16' then 'Centro de Distribución'
when ${TABLE}.centro='DR15' then 'Centro de Distribución'
when ${TABLE}.centro='PI14' then 'Planta'
when ${TABLE}.centro='AI01' then 'Centro de Distribución'
when ${TABLE}.centro='PI08' then 'Planta'
when ${TABLE}.centro='PI10' then 'Planta'
when ${TABLE}.centro='PT01' then 'Centro de Distribución'
when ${TABLE}.centro='DA09' then 'Centro de Distribución'
when ${TABLE}.centro='DA03' then 'Centro de Distribución'
when ${TABLE}.centro='DA28' then 'Centro de Distribución'
when ${TABLE}.centro='DA19' then 'Centro de Distribución'
when ${TABLE}.centro='AM01' then 'Centro de Distribución'
when ${TABLE}.centro='DA08' then 'Centro de Distribución'
when ${TABLE}.centro='DA13' then 'Centro de Distribución'
when ${TABLE}.centro='DA01' then 'Centro de Distribución'
when ${TABLE}.centro='DA02' then 'Centro de Distribución'
when ${TABLE}.centro='DN05' then 'Centro de Distribución'
when ${TABLE}.centro='DN18' then 'Centro de Distribución'
when ${TABLE}.centro='DN19' then 'Centro de Distribución'
when ${TABLE}.centro='DA20' then 'Centro de Distribución'
when ${TABLE}.centro='DR01' then 'Centro de Distribución'
when ${TABLE}.centro='PI19' then 'Planta'
when ${TABLE}.centro='PI13' then 'Planta'
when ${TABLE}.centro='DN08' then 'Centro de Distribución'
when ${TABLE}.centro='DA21' then 'Centro de Distribución'
when ${TABLE}.centro='DA22' then 'Centro de Distribución'
when ${TABLE}.centro='DE01' then 'Centro de Distribución'
when ${TABLE}.centro='PI05' then 'Planta'
when ${TABLE}.centro='DR20' then 'Centro de Distribución'
when ${TABLE}.centro='PI01' then 'Planta'
when ${TABLE}.centro='PG20' then 'Centro de Distribución' END ;;
  }

dimension: sku {
  type: string
  sql: ${TABLE}.SKU ;;
}

dimension: periodo_num {
  type: string
  sql: ${TABLE}.PeriodoNum ;;
}

dimension: periodo {
  type: string
  sql: ${TABLE}.Periodo ;;
}

dimension: precioventa {
  type: number
  sql: ${TABLE} END.precioventa ;;
}

dimension: costo {
  type: number
  sql: ${TABLE}.costo ;;
}

dimension: costo_absorbente {
  type: number
  sql: ${TABLE}.costo_absorbente ;;
}

dimension: cantidad {
  type: number
  sql: ${TABLE}.cantidad ;;
}






  measure: Total_importe_costo {
    label: "importe costo"
    type: sum
    sql: ${TABLE}.costo ;;
    value_format:"#,##0;(#,##0)"
  }

  measure: Total_importe_absorbente {
    label: "importe costo absorbente"
    type: sum
    sql: ${TABLE}.costo_absorbente ;;
    value_format:"#,##0;(#,##0)"
  }

  measure: Total_cantidad {
    label: "importe Cantidad"
    type: sum
    sql: ${TABLE}.cantidad ;;
    value_format:"#,##0;(#,##0)"
  }


  measure: Total_PTTO {

    type: number
    # label:  "Stock"
    label_from_parameter: Tipo_Ptto
    sql:
    {% if Tipo_Ptto._parameter_value == 'Cantidad' %}
       ${Total_cantidad}

      {% elsif Tipo_Ptto._parameter_value == 'importe_Absorbente' %}
      ${Total_importe_absorbente}

      {% elsif Tipo_Ptto._parameter_value == 'Costo' %}
      ${Total_importe_costo}





      {% endif %};;
    # drill_fields: [almacen,material,material_desc,Total_Materiales,Total_stock_libre_utilizacion]
    value_format:"#,##0;(#,##0)"
  }

set: detail {
  fields: [
    tipomaterial,
    um,
    grupoarticulo,
    grupoarticuloexterno,
    claveidioma,
    articulodescribe,
    id_concepto,
    concepto,
    centro,
    sku,
    periodo_num,
    periodo,
    precioventa,
    costo,
    costo_absorbente,
    cantidad
  ]
}
}
