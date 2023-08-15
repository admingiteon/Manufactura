
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

 # dimension: grupoarticulo {
 #   type: string
 #   sql: ${TABLE}.grupoarticulo ;;
 # }

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
    label: "Concepto"
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

  dimension: sku_describe {
    type: string
    sql:concat(SUBSTR(${TABLE}.sku,12,50)  ,'-',  ${TABLE}.articulodescribe) ;;
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
    value_format:"#,##0;(#,##0)"
  }

   measure: Total_importe_variable {
    label: "importe variable"
    type: sum
    sql: ${TABLE}.importe_variable ;;
    value_format:"#,##0;(#,##0)"
  }

   measure: Total_importe_estandar {
    label: "importe estandar"
    type: sum
    sql: ${TABLE}.importe_estandar ;;
    value_format:"#,##0;(#,##0)"
  }

   measure: Total_importe_absorbente {
    label: "importe absorbente"
    type: sum
    sql: ${TABLE}.importe_absorbente ;;
    value_format:"#,##0;(#,##0)"
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
