
view: vw_largo_plazo_presupuesto {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.vw_largo_plazo_presupuesto`  where  grupoarticulo in  ('AM',
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
      label: "Cantidad"
      value: "Cantidad"
    }


    allowed_value: {
      label: "Importe Absorbente"
      value: "importe_Absorbente"
    }

    allowed_value: {
      label: "Importe Estandar"
      value: "Importe_Estandar"
    }

    allowed_value: {
      label: "Importe Variable"
      value: "Importe_Variable"
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

  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: importe_variable {
    type: number
    sql: ${TABLE}.importe_variable ;;
  }

  dimension: importe_estandar {
    type: number
    sql: ${TABLE}.importe_estandar ;;
  }

  dimension: importe_absorbente {
    type: number
    sql: ${TABLE}.importe_absorbente ;;
  }


  measure: Total_cantidad {
    type: sum
    sql: ${TABLE}.Cantidad ;;
  }

   measure: Total_importe_variable {
    type: sum
    sql: ${TABLE}.importe_variable ;;
  }

   measure: Total_importe_estandar {
    type: sum
    sql: ${TABLE}.importe_estandar ;;
  }

   measure: Total_importe_absorbente {
    type: sum
    sql: ${TABLE}.importe_absorbente ;;
  }


  measure: Total_sku{
    label: "cantidad SKU unicos"
    type: count_distinct
    sql:${sku};;

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

      {% elsif Tipo_Ptto._parameter_value == 'Importe_Estandar' %}
      ${Total_importe_estandar}

      {% elsif Tipo_Ptto._parameter_value == 'Importe_Variable' %}
      ${Total_importe_variable}



      {% endif %};;
   # drill_fields: [almacen,material,material_desc,Total_Materiales,Total_stock_libre_utilizacion]

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
  sku,
  periodo_num,
  periodo,
  cantidad,
  importe_variable,
  importe_estandar,
  importe_absorbente
    ]
  }
}
