
view: res_vw_lp_ibp_planeacion_demanda {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.quality_data.vw_lp_ibp_planeacion_demanda` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_de_sociedad__ibp_ {
    type: string
    sql: ${TABLE}.ID_de_Sociedad__IBP_ ;;
  }

  dimension: id_de_planta__ibp_ {
    type: string
    sql: ${TABLE}.ID_de_Planta__IBP_ ;;
  }

  dimension: id_de_mercado__ibp_ {
    type: string
    sql: ${TABLE}.ID_de_Mercado__IBP_ ;;
  }

  dimension: desc_de_mercado__ibp_ {
    type: string
    sql: ${TABLE}.Desc_de_Mercado__IBP_ ;;
  }

  dimension: id_de_ubicaci__n__ibp_ {
    type: string
    sql: ${TABLE}.ID_de_Ubicaci__n__IBP_ ;;
  }

  dimension: id_de_producto__ibp_ {
    type: string
    sql: ${TABLE}.ID_de_Producto__IBP_ ;;
  }

  dimension: mercado_prioritario__ibp_ {
    type: string
    sql: ${TABLE}.Mercado_Prioritario__IBP_ ;;
  }

  dimension: grupo_de_articulos__dato_maestro_ {
    type: string
    sql: ${TABLE}.Grupo_de_Articulos__dato_maestro_ ;;
  }

  dimension: grupo_de_articulos_externo__dato_maestro_ {
    type: string
    sql: ${TABLE}.Grupo_de_Articulos_Externo__dato_maestro_ ;;
  }

  dimension: key_figure__ibp_ {
    type: string
    sql: ${TABLE}.Key_Figure__IBP_ ;;
  }

  dimension: jun_2021 {
    type: number
    sql: ${TABLE}.JUN_2021 ;;
  }

  dimension: jul_2021 {
    type: number
    sql: ${TABLE}.JUL_2021 ;;
  }

  dimension: ago_2021 {
    type: number
    sql: ${TABLE}.AGO_2021 ;;
  }

  dimension: sep_2021 {
    type: number
    sql: ${TABLE}.SEP_2021 ;;
  }

  dimension: oct_2021 {
    type: number
    sql: ${TABLE}.OCT_2021 ;;
  }

  dimension: nov_2021 {
    type: number
    sql: ${TABLE}.NOV_2021 ;;
  }

  dimension: dic_2021 {
    type: number
    sql: ${TABLE}.DIC_2021 ;;
  }

  dimension: ene_2022 {
    type: number
    sql: ${TABLE}.ENE_2022 ;;
  }

  dimension: feb_2022 {
    type: number
    sql: ${TABLE}.FEB_2022 ;;
  }

  dimension: mar_2022 {
    type: number
    sql: ${TABLE}.MAR_2022 ;;
  }

  dimension: abr_2022 {
    type: number
    sql: ${TABLE}.ABR_2022 ;;
  }

  dimension: may_2022 {
    type: number
    sql: ${TABLE}.MAY_2022 ;;
  }

  dimension: jun_2022 {
    type: number
    sql: ${TABLE}.JUN_2022 ;;
  }

  dimension: jul_2022 {
    type: number
    sql: ${TABLE}.JUL_2022 ;;
  }

  dimension: ago_2022 {
    type: number
    sql: ${TABLE}.AGO_2022 ;;
  }

  dimension: sep_2022 {
    type: number
    sql: ${TABLE}.SEP_2022 ;;
  }

  dimension: oct_2022 {
    type: number
    sql: ${TABLE}.OCT_2022 ;;
  }

  dimension: nov_2022 {
    type: number
    sql: ${TABLE}.NOV_2022 ;;
  }

  dimension: dic_2022 {
    type: number
    sql: ${TABLE}.DIC_2022 ;;
  }

  dimension: ene_2023 {
    type: number
    sql: ${TABLE}.ENE_2023 ;;
  }

  dimension: feb_2023 {
    type: number
    sql: ${TABLE}.FEB_2023 ;;
  }

  dimension: mar_2023 {
    type: number
    sql: ${TABLE}.MAR_2023 ;;
  }

  dimension: abr_2023 {
    type: number
    sql: ${TABLE}.ABR_2023 ;;
  }

  dimension: may_2023 {
    type: number
    sql: ${TABLE}.MAY_2023 ;;
  }

  dimension: jun_2023 {
    type: number
    sql: ${TABLE}.JUN_2023 ;;
  }

  dimension: jul_2023 {
    type: number
    sql: ${TABLE}.JUL_2023 ;;
  }

  dimension: ago_2023 {
    type: number
    sql: ${TABLE}.AGO_2023 ;;
  }

  dimension: sep_2023 {
    type: number
    sql: ${TABLE}.SEP_2023 ;;
  }

  dimension: oct_2023 {
    type: number
    sql: ${TABLE}.OCT_2023 ;;
  }

  dimension: nov_2023 {
    type: number
    sql: ${TABLE}.NOV_2023 ;;
  }

  dimension: dic_2023 {
    type: number
    sql: ${TABLE}.DIC_2023 ;;
  }

  dimension: ene_2024 {
    type: number
    sql: ${TABLE}.ENE_2024 ;;
  }

  dimension: feb_2024 {
    type: number
    sql: ${TABLE}.FEB_2024 ;;
  }

  dimension: mar_2024 {
    type: number
    sql: ${TABLE}.MAR_2024 ;;
  }

  dimension: abr_2024 {
    type: number
    sql: ${TABLE}.ABR_2024 ;;
  }

  dimension: may_2024 {
    type: number
    sql: ${TABLE}.MAY_2024 ;;
  }

  dimension: jun_2024 {
    type: number
    sql: ${TABLE}.JUN_2024 ;;
  }

  dimension: jul_2024 {
    type: number
    sql: ${TABLE}.JUL_2024 ;;
  }

  dimension: ago_2024 {
    type: number
    sql: ${TABLE}.AGO_2024 ;;
  }

  dimension: sep_2024 {
    type: number
    sql: ${TABLE}.SEP_2024 ;;
  }

  dimension: oct_2024 {
    type: number
    sql: ${TABLE}.OCT_2024 ;;
  }

  dimension: nov_2024 {
    type: number
    sql: ${TABLE}.NOV_2024 ;;
  }

  dimension: dic_2024 {
    type: number
    sql: ${TABLE}.DIC_2024 ;;
  }

  dimension: ene_2025 {
    type: number
    sql: ${TABLE}.ENE_2025 ;;
  }

  dimension: feb_2025 {
    type: number
    sql: ${TABLE}.FEB_2025 ;;
  }

  dimension: mar_2025 {
    type: number
    sql: ${TABLE}.MAR_2025 ;;
  }

  dimension: abr_2025 {
    type: number
    sql: ${TABLE}.ABR_2025 ;;
  }

  dimension: may_2025 {
    type: number
    sql: ${TABLE}.MAY_2025 ;;
  }

  dimension: jun_2025 {
    type: number
    sql: ${TABLE}.JUN_2025 ;;
  }

  set: detail {
    fields: [
        id_de_sociedad__ibp_,
  id_de_planta__ibp_,
  id_de_mercado__ibp_,
  desc_de_mercado__ibp_,
  id_de_ubicaci__n__ibp_,
  id_de_producto__ibp_,
  mercado_prioritario__ibp_,
  grupo_de_articulos__dato_maestro_,
  grupo_de_articulos_externo__dato_maestro_,
  key_figure__ibp_,
  jun_2021,
  jul_2021,
  ago_2021,
  sep_2021,
  oct_2021,
  nov_2021,
  dic_2021,
  ene_2022,
  feb_2022,
  mar_2022,
  abr_2022,
  may_2022,
  jun_2022,
  jul_2022,
  ago_2022,
  sep_2022,
  oct_2022,
  nov_2022,
  dic_2022,
  ene_2023,
  feb_2023,
  mar_2023,
  abr_2023,
  may_2023,
  jun_2023,
  jul_2023,
  ago_2023,
  sep_2023,
  oct_2023,
  nov_2023,
  dic_2023,
  ene_2024,
  feb_2024,
  mar_2024,
  abr_2024,
  may_2024,
  jun_2024,
  jul_2024,
  ago_2024,
  sep_2024,
  oct_2024,
  nov_2024,
  dic_2024,
  ene_2025,
  feb_2025,
  mar_2025,
  abr_2025,
  may_2025,
  jun_2025
    ]
  }
}
