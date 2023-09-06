
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
'VDD') ;;
  }


  parameter: Tipo_Ptto {
    label: "Tipo Ptro"
    type: unquoted



    allowed_value: {
      label: "Costo"
      value: "Costo"
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

dimension: grupoarticulo {
  type: string
  sql: ${TABLE}.grupoarticulo ;;
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
  sql: ${TABLE}.precioventa ;;
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
