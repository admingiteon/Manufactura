---
- dashboard: tablero_largo_plazo_almacenamientosimulacion
  title: Tablero Largo Plazo (Almacenamiento)-Simulacion
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: n4iuJFuaDsDUk9kyratSAE
  elements:
  - title: Tablero Largo Plazo (Almacenamiento)-Simulacion
    name: Tablero Largo Plazo (Almacenamiento)-Simulacion
    model: cadena_suministro
    explore: alm_pt_almacenamiento_sim
    type: looker_grid
    fields: [alm_pt_almacenamiento_sim.idconcepto, alm_pt_almacenamiento_sim.concepto,
      alm_pt_almacenamiento_sim.total, alm_pt_almacenamiento_sim.fecha_month]
    pivots: [alm_pt_almacenamiento_sim.fecha_month]
    fill_fields: [alm_pt_almacenamiento_sim.fecha_month]
    sorts: [alm_pt_almacenamiento_sim.fecha_month, alm_pt_almacenamiento_sim.idconcepto]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
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
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      alm_pt_almacenamiento_sim.total:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
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
    hidden_fields: [alm_pt_almacenamiento_sim.idconcepto]
    listen:
      Planta: alm_pt_almacenamiento_sim.planta
      Grupo Art: alm_pt_almacenamiento_sim.grupo_art
      Centro: alm_pt_almacenamiento_sim.centro
    row: 2
    col: 0
    width: 24
    height: 12
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
    explore: alm_pt_almacenamiento_sim
    listens_to_filters: [Centro, Grupo Art]
    field: alm_pt_almacenamiento_sim.planta
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
    explore: alm_pt_almacenamiento_sim
    listens_to_filters: [Centro, Planta]
    field: alm_pt_almacenamiento_sim.grupo_art
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
    explore: alm_pt_almacenamiento_sim
    listens_to_filters: [Planta, Grupo Art]
    field: alm_pt_almacenamiento_sim.centro
