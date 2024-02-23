---
- dashboard: demanda_calculada
  title: Demanda Calculada
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: cfwNL4TvxmmFYFdhMAlws8
  elements:
  - title: Demanda
    name: Demanda
    model: cadena_suministro
    explore: demanda_calculos
    type: looker_grid
    fields: [demanda_calculos.sku, demanda_calculos.cantidad, demanda_calculos.fecha,
      demanda_calculos.fecha_inicio_produccion, demanda_calculos.grupo_articulos_externos,
      demanda_calculos.unidad_medida, demanda_calculos.posicion_actual, demanda_calculos.plazo_entrega,
      demanda_calculos.cantidad_requerida]
    sorts: [demanda_calculos.fecha desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '10'
    rows_font_size: '10'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    minimum_column_width: 75
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", demanda_calculos.grupo_articulos_externos,
      demanda_calculos.sku, demanda_calculos.unidad_medida, demanda_calculos.fecha,
      demanda_calculos.plazo_entrega, demanda_calculos.cantidad, demanda_calculos.posicion_actual,
      demanda_calculos.cantidad_requerida, demanda_calculos.fecha_inicio_produccion]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    listen:
      SKU: demanda_calculos.sku
      Grupo Articulos Externos: demanda_calculos.grupo_articulos_externos
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
  - name: SKU
    title: SKU
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: demanda_calculos
    listens_to_filters: []
    field: demanda_calculos.sku
  - name: Grupo Articulos Externos
    title: Grupo Articulos Externos
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: demanda_calculos
    listens_to_filters: []
    field: demanda_calculos.grupo_articulos_externos
