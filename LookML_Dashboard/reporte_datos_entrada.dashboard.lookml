---
- dashboard: reporte_datos_de_entrada_largo_plazo
  title: Reporte Datos de entrada (Largo Plazo)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: N2BAUyfitfmD7ZVrM0OtYF
  elements:
  - title: Planeación de la demanda Forecast
    name: Planeación de la demanda Forecast
    model: cadena_suministro
    explore: pv_forecast_completo_lp
    type: looker_grid
    fields: [pv_forecast_completo_lp.Total_cantidad, pv_forecast_completo_lp.Fecha_creacion_month,
      pv_forecast_completo_lp.sku, pv_forecast_completo_lp.centro, pv_forecast_completo_lp.mercado,
      cliente]
    pivots: [pv_forecast_completo_lp.Fecha_creacion_month]
    fill_fields: [pv_forecast_completo_lp.Fecha_creacion_month]
    sorts: [pv_forecast_completo_lp.Fecha_creacion_month, pv_forecast_completo_lp.Total_cantidad
        desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: "substring(${pv_forecast_completo_lp.mercado},position(${pv_forecast_completo_lp.mercado},\"\
        __\")-6,6) \n"
      label: Cliente
      value_format:
      value_format_name:
      dimension: cliente
      _kind_hint: dimension
      _type_hint: string
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
    series_labels:
      pv_forecast_completo_lp.Fecha_creacion_month: Mes
    series_cell_visualizations:
      pv_forecast_completo_lp.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Centro: pv_forecast_completo_lp.centro
      Mercado: pv_forecast_completo_lp.mercado
      Material: pv_forecast_completo_lp.sku
    row: 2
    col: 0
    width: 24
    height: 12
  - title: Inventario de producto terminado Comprados
    name: Inventario de producto terminado Comprados
    model: cadena_suministro
    explore: pv_lp_pt_comprados_inventario_lu_1
    type: looker_grid
    fields: [pv_lp_pt_comprados_inventario_lu_1.fecha_date, pv_lp_pt_comprados_inventario_lu_1.material,
      pv_lp_pt_comprados_inventario_lu_1.centro, pv_lp_pt_comprados_inventario_lu_1.fecha_orden_de_compra_date,
      pv_lp_pt_comprados_inventario_lu_1.Total_cantidad]
    filters:
      pv_lp_pt_comprados_inventario_lu_1.fecha_orden_de_compra_date: NOT NULL
    sorts: [pv_lp_pt_comprados_inventario_lu_1.fecha_date desc]
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
      pv_lp_pt_comprados_inventario_lu_1.Total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    defaults_version: 1
    listen:
      Material: pv_lp_pt_comprados_inventario_lu_1.sku
    row: 14
    col: 0
    width: 24
    height: 4
  - title: Material Fabricado
    name: Material Fabricado
    model: cadena_suministro
    explore: pv_lp_pt_fabricados_inventario_lu_1
    type: looker_grid
    fields: [pv_lp_pt_fabricados_inventario_lu_1.fecha_date, pv_lp_pt_fabricados_inventario_lu_1.centro,
      pv_lp_pt_fabricados_inventario_lu_1.centro_fabricacion, pv_lp_pt_fabricados_inventario_lu_1.fecha_inicio_produccion_date,
      pv_lp_pt_fabricados_inventario_lu_1.sku, pv_lp_pt_fabricados_inventario_lu_1.Total_cantidad_requerida]
    filters:
      pv_lp_pt_fabricados_inventario_lu_1.Total_cantidad_requerida: not 0
    sorts: [pv_lp_pt_fabricados_inventario_lu_1.fecha_date desc]
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
      pv_lp_pt_fabricados_inventario_lu_1.Total_cantidad:
        is_active: false
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
    column_order: ["$$$_row_numbers_$$$", pv_lp_pt_fabricados_inventario_lu_1.fecha_date,
      pv_lp_pt_fabricados_inventario_lu_1.sku, pv_lp_pt_fabricados_inventario_lu_1.material,
      pv_lp_pt_fabricados_inventario_lu_1.centro, pv_lp_pt_fabricados_inventario_lu_1.centro_fabricacion,
      pv_lp_pt_fabricados_inventario_lu_1.fecha_inicio_produccion_date, pv_lp_pt_fabricados_inventario_lu_1.Total_cantidad]
    hidden_pivots: {}
    listen:
      Centro: pv_lp_pt_fabricados_inventario_lu_1.centro
      Material: pv_lp_pt_fabricados_inventario_lu_1.sku
    row: 18
    col: 0
    width: 24
    height: 6
  - title: Inventario Actual Insumos
    name: Inventario Actual Insumos
    model: cadena_suministro
    explore: pv_lp_insumo_inventario_1
    type: looker_grid
    fields: [pv_lp_insumo_inventario_1.componente, pv_lp_insumo_inventario_1.sku,
      pv_lp_insumo_inventario_1.centro, pv_lp_insumo_inventario_1.unidad_medida, pv_lp_insumo_inventario_1.posicion_actual_max]
    sorts: [pv_lp_insumo_inventario_1.componente]
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
    column_order: ["$$$_row_numbers_$$$", pv_lp_insumo_inventario_1.sku, pv_lp_insumo_inventario_1.centro,
      pv_lp_insumo_inventario_1.componente, pv_lp_insumo_inventario_1.posicion_actual,
      pv_lp_insumo_inventario_1.fecha_inicio_produccion_date, pv_lp_insumo_inventario_1.fecha_orden_de_compra_date]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      pv_lp_insumo_inventario_1.componente: Insumo
    series_cell_visualizations:
      pv_lp_insumo_inventario_1.posicion_actual_max:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    defaults_version: 1
    listen:
      Centro: pv_lp_insumo_inventario_1.centro
      Material: pv_lp_insumo_inventario_1.sku
    row: 24
    col: 0
    width: 24
    height: 6
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
  - name: Material
    title: Material
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: pv_forecast_completo_lp
    listens_to_filters: []
    field: pv_forecast_completo_lp.sku
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
    explore: pv_forecast_completo_lp
    listens_to_filters: []
    field: pv_forecast_completo_lp.centro
  - name: Mercado
    title: Mercado
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: pv_forecast_completo_lp
    listens_to_filters: []
    field: pv_forecast_completo_lp.mercado
