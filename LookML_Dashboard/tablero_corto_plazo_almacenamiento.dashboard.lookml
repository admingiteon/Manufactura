---
- dashboard: tablero_corto_plazo_almacenamiento
  title: Tablero Corto Plazo (Almacenamiento)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 1GUxEYO9rNTR0uF7a2fQl3
  elements:
  - title: Tablero Corto Plazo (Almacenamiento CP)
    name: Tablero Corto Plazo (Almacenamiento CP)
    model: cadena_suministro
    explore: alm_cp_pt_almacenamiento
    type: looker_grid
    fields: [alm_cp_pt_almacenamiento.idconcepto, alm_cp_pt_almacenamiento.concepto,
      alm_cp_pt_almacenamiento.total, alm_cp_pt_almacenamiento.fecha_week]
    pivots: [alm_cp_pt_almacenamiento.fecha_week]
    fill_fields: [alm_cp_pt_almacenamiento.fecha_week]
    sorts: [alm_cp_pt_almacenamiento.fecha_week, alm_cp_pt_almacenamiento.idconcepto]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      alm_cp_pt_almacenamiento.fecha_month: Fecha
    series_cell_visualizations:
      alm_cp_pt_almacenamiento.total:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    hidden_fields:
    defaults_version: 1
    listen:
      Planta: alm_cp_pt_almacenamiento.planta
      Grupo Art: alm_cp_pt_almacenamiento.grupo_art
      Centro: alm_cp_pt_almacenamiento.centro
    row: 2
    col: 0
    width: 24
    height: 7
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"border-radius: 5px; padding: 5px 10px; background: #154360;\
      \ height: 60px; color: red;\">\n\t<nav style=\"font-size: 18px;\">\n\t\t<img\
      \ style=\"color: #efefef; padding: 5px 15px; float: left; height: 40px;\" src=\"\
      https://wwwstatic.lookercdn.com/logos/looker_all_white.svg\"/>\n\t\t<a style=\"\
      color: #efefef; padding: 5px 15px; float: left; line-height: 40px; font-weight:\
      \ bold;\" >CADENA DE SUMINISTRO</a>\n\t\t\n\t\t\n\t</nav>\n</div>"
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Centro
    title: Centro
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: alm_cp_pt_almacenamiento
    listens_to_filters: []
    field: alm_cp_pt_almacenamiento.centro
  - name: Planta
    title: Planta
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: alm_cp_pt_almacenamiento
    listens_to_filters: [Centro]
    field: alm_cp_pt_almacenamiento.planta
  - name: Grupo Art
    title: Grupo Art
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: alm_cp_pt_almacenamiento
    listens_to_filters: [Centro]
    field: alm_cp_pt_almacenamiento.grupo_art
