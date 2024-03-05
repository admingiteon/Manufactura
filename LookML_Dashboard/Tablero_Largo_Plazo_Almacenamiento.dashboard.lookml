---
- dashboard: tablero_largo_plazo_almacenamiento
  title: Tablero Largo Plazo (Almacenamiento)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: JVjv9WNfYDNdwGqz6S1UYI
  elements:
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
  - title: Tablero Largo Plazo (Almacenamiento LP)
    name: Tablero Largo Plazo (Almacenamiento LP)
    model: cadena_suministro
    explore: alm_lp_pt_almacenamiento
    type: looker_grid
    fields: [alm_lp_pt_almacenamiento.idconcepto, alm_lp_pt_almacenamiento.concepto,
      alm_lp_pt_almacenamiento.total, alm_lp_pt_almacenamiento.fecha_month]
    pivots: [alm_lp_pt_almacenamiento.fecha_month]
    fill_fields: [alm_lp_pt_almacenamiento.fecha_month]
    sorts: [alm_lp_pt_almacenamiento.fecha_month, alm_lp_pt_almacenamiento.idconcepto]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [alm_lp_pt_almacenamiento.idconcepto, alm_lp_pt_almacenamiento.centro,
      alm_lp_pt_almacenamiento.concepto, 2023-11_alm_lp_pt_almacenamiento.total, 2023-12_alm_lp_pt_almacenamiento.total,
      2024-01_alm_lp_pt_almacenamiento.total, 2024-02_alm_lp_pt_almacenamiento.total,
      2024-03_alm_lp_pt_almacenamiento.total, 2024-04_alm_lp_pt_almacenamiento.total,
      2024-05_alm_lp_pt_almacenamiento.total, 2024-06_alm_lp_pt_almacenamiento.total,
      2024-07_alm_lp_pt_almacenamiento.total, 2024-08_alm_lp_pt_almacenamiento.total,
      2024-09_alm_lp_pt_almacenamiento.total, 2024-10_alm_lp_pt_almacenamiento.total,
      2024-11_alm_lp_pt_almacenamiento.total, 2024-12_alm_lp_pt_almacenamiento.total,
      2025-01_alm_lp_pt_almacenamiento.total, 2025-02_alm_lp_pt_almacenamiento.total,
      2025-03_alm_lp_pt_almacenamiento.total, 2025-04_alm_lp_pt_almacenamiento.total,
      2025-05_alm_lp_pt_almacenamiento.total, 2025-06_alm_lp_pt_almacenamiento.total,
      2025-07_alm_lp_pt_almacenamiento.total, 2025-08_alm_lp_pt_almacenamiento.total,
      2025-09_alm_lp_pt_almacenamiento.total, 2025-10_alm_lp_pt_almacenamiento.total,
      2025-11_alm_lp_pt_almacenamiento.total, 2025-12_alm_lp_pt_almacenamiento.total,
      2026-01_alm_lp_pt_almacenamiento.total, 2026-02_alm_lp_pt_almacenamiento.total,
      2026-03_alm_lp_pt_almacenamiento.total, 2026-04_alm_lp_pt_almacenamiento.total,
      2026-05_alm_lp_pt_almacenamiento.total, 2026-06_alm_lp_pt_almacenamiento.total,
      2026-07_alm_lp_pt_almacenamiento.total, 2026-08_alm_lp_pt_almacenamiento.total,
      2026-09_alm_lp_pt_almacenamiento.total, 2026-10_alm_lp_pt_almacenamiento.total,
      2026-11_alm_lp_pt_almacenamiento.total]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      alm_lp_pt_almacenamiento.idconcepto: Id
    series_column_widths:
      alm_lp_pt_almacenamiento.concepto: 280
    series_cell_visualizations:
      alm_lp_pt_almacenamiento.total:
        is_active: false
    series_collapsed:
      alm_lp_pt_almacenamiento.centro: true
    header_font_color: "#fff"
    header_background_color: "#154360"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields:
    hidden_pivots: {}
    listen:
      Centro: alm_lp_pt_almacenamiento.centro
      Planta: alm_lp_pt_almacenamiento.planta
      Grupo Art: alm_lp_pt_almacenamiento.grupo_art
      Tipo Escenario: alm_lp_pt_almacenamiento.tipo_escenario
    row: 2
    col: 0
    width: 24
    height: 7
  filters:
  - name: Planta
    title: Planta
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cadena_suministro
    explore: alm_lp_pt_almacenamiento
    listens_to_filters: [Centro, Grupo Art]
    field: alm_lp_pt_almacenamiento.planta
  - name: Grupo Art
    title: Grupo Art
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cadena_suministro
    explore: alm_lp_pt_almacenamiento
    listens_to_filters: [Centro, Planta]
    field: alm_lp_pt_almacenamiento.grupo_art
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
    explore: alm_lp_pt_almacenamiento
    listens_to_filters: [Planta, Grupo Art]
    field: alm_lp_pt_almacenamiento.centro
  - name: Tipo Escenario
    title: Tipo Escenario
    type: field_filter
    default_value: Simulado
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: cadena_suministro
    explore: alm_lp_pt_almacenamiento
    listens_to_filters: []
    field: alm_lp_pt_almacenamiento.tipo_escenario
