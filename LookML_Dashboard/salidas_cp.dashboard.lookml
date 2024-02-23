---
- dashboard: salidas_cp
  title: Salidas CP
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: C2Jm4uGueslswlBE3NCtbX
  elements:
  - title: Posición de inventario
    name: Posición de inventario
    model: cadena_suministro
    explore: salida_cp_pt_inventario_lu_1
    type: looker_grid
    fields: [salida_cp_pt_inventario_lu_1.material, salida_cp_pt_inventario_lu_1.fecha_week,
      salida_cp_pt_inventario_lu_1.Centro, salida_cp_pt_inventario_lu_1.Total_posicion_actual,
      salida_cp_pt_inventario_lu_1.Total_Cantidad, salida_cp_pt_inventario_lu_1.Total_tamano_lote_fabricacion,
      salida_cp_pt_inventario_lu_1.Total_cantidad_requerida, salida_cp_pt_inventario_lu_1.Total_stock_seguridad,
      salida_cp_pt_inventario_lu_1.Tipo_Producto]
    sorts: [salida_cp_pt_inventario_lu_1.fecha_week desc]
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
    column_order: ["$$$_row_numbers_$$$", salida_cp_pt_inventario_lu_1.material, salida_cp_pt_inventario_lu_1.fecha_week,
      salida_cp_pt_inventario_lu_1.Centro, salida_cp_pt_inventario_lu_1.Total_Cantidad,
      salida_cp_pt_inventario_lu_1.Total_posicion_actual, salida_cp_pt_inventario_lu_1.Total_stock_seguridad,
      salida_cp_pt_inventario_lu_1.Total_cantidad_requerida, salida_cp_pt_inventario_lu_1.Total_tamano_lote_fabricacion]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      salida_cp_pt_inventario_lu_1.Cantidad: Ventas
      salida_cp_pt_inventario_lu_1.posicion_actual: inventario Inicial
      salida_cp_pt_inventario_lu_1.Cantidad_requerida: Fabricación
    series_cell_visualizations:
      salida_cp_pt_inventario_lu_1.Total_posicion_actual:
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Material: salida_cp_pt_inventario_lu_1.material
      Centro: salida_cp_pt_inventario_lu_1.Centro
    row: 2
    col: 0
    width: 24
    height: 5
  - title: Fabricaciòn
    name: Fabricaciòn
    model: cadena_suministro
    explore: salida_modelo_de_calculo_fabricacion_cp
    type: looker_grid
    fields: [salida_modelo_de_calculo_fabricacion_cp.material, salida_modelo_de_calculo_fabricacion_cp.centro,
      salida_modelo_de_calculo_fabricacion_cp.fecha_inicio_produccion_week, salida_modelo_de_calculo_fabricacion_cp.cantidad_requerida]
    sorts: [salida_modelo_de_calculo_fabricacion_cp.material]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Material: salida_modelo_de_calculo_fabricacion_cp.material
      Centro: salida_modelo_de_calculo_fabricacion_cp.centro
    row: 13
    col: 0
    width: 24
    height: 6
  - title: Insumo Inventario
    name: Insumo Inventario
    model: cadena_suministro
    explore: salida_cp_insumo_inventario_1
    type: looker_grid
    fields: [salida_cp_insumo_inventario_1.material, salida_cp_insumo_inventario_1.Centro,
      salida_cp_insumo_inventario_1.componente, salida_cp_insumo_inventario_1.fecha_inicio_produccion_week,
      salida_cp_insumo_inventario_1.fecha_orden_de_compra_week, salida_cp_insumo_inventario_1.posicion_actual]
    sorts: [salida_cp_insumo_inventario_1.fecha_inicio_produccion_week desc]
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
    header_font_color: "#ffff"
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
    listen:
      Material: salida_cp_insumo_inventario_1.material
      Centro: salida_cp_insumo_inventario_1.Centro
    row: 26
    col: 0
    width: 24
    height: 7
  - title: Insumo Compras
    name: Insumo Compras
    model: cadena_suministro
    explore: salida_cp_insumo_compras_1
    type: looker_grid
    fields: [salida_cp_insumo_compras_1.Material, salida_cp_insumo_compras_1.Centro,
      salida_cp_insumo_compras_1.componente, salida_cp_insumo_compras_1.fecha_inicio_produccion_week,
      salida_cp_insumo_compras_1.fecha_orden_de_compra_week, salida_cp_insumo_compras_1.cantidad_requerida]
    sorts: [salida_cp_insumo_compras_1.fecha_inicio_produccion_week desc]
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
    listen:
      Material: salida_cp_insumo_compras_1.Material
      Centro: salida_cp_insumo_compras_1.Centro
    row: 33
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
  - title: Capacidad de Fabricación
    name: Capacidad de Fabricación
    model: cadena_suministro
    explore: salida_cp_pt_fabricacion_1
    type: looker_grid
    fields: [salida_cp_pt_fabricacion_1.material, salida_cp_pt_fabricacion_1.Centro,
      salida_cp_pt_fabricacion_1.prioridad, salida_cp_pt_fabricacion_1.fecha_week,
      salida_cp_pt_fabricacion_1.Totalcantidad_requerida, salida_cp_pt_fabricacion_1.Total_cantidad_producible,
      salida_cp_pt_fabricacion_1.centro_suministrador, salida_cp_pt_fabricacion_1.producible]
    sorts: [salida_cp_pt_fabricacion_1.material]
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
      salida_cp_pt_fabricacion_1.Totalcantidad_requerida:
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    column_order: ["$$$_row_numbers_$$$", salida_cp_pt_fabricacion_1.material, salida_cp_pt_fabricacion_1.centro_suministrador,
      salida_cp_pt_fabricacion_1.Centro, salida_cp_pt_fabricacion_1.prioridad, salida_cp_pt_fabricacion_1.fecha_week,
      salida_cp_pt_fabricacion_1.Totalcantidad_requerida, salida_cp_pt_fabricacion_1.Total_cantidad_producible]
    series_labels:
      salida_cp_pt_fabricacion_1.Centro: Planta
    listen:
      Material: salida_cp_pt_fabricacion_1.material
      Centro: salida_cp_pt_fabricacion_1.Centro
    row: 19
    col: 0
    width: 24
    height: 7
  - title: Compras Pt
    name: Compras Pt
    model: cadena_suministro
    explore: salida_cp_pt_comprados_inventario_lu_1
    type: looker_grid
    fields: [salida_cp_pt_comprados_inventario_lu_1.material, salida_cp_pt_comprados_inventario_lu_1.centro,
      salida_cp_pt_comprados_inventario_lu_1.fecha_week, salida_cp_pt_comprados_inventario_lu_1.fecha_orden_de_compra_week]
    sorts: [salida_cp_pt_comprados_inventario_lu_1.fecha_week]
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
    series_labels:
      salida_cp_pt_comprados_inventario_lu_1.fecha_week: Fecha
      salida_cp_pt_comprados_inventario_lu_1.fecha_orden_de_compra_week: Fecha Orden
        de Compra
    series_cell_visualizations:
      salida_cp_pt_comprados_inventario_lu_1.Total_cantidad_a_comprar:
        is_active: false
    header_font_color: "#FFF"
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
    hidden_pivots: {}
    listen:
      Material: salida_cp_pt_comprados_inventario_lu_1.material
      Centro: salida_cp_pt_comprados_inventario_lu_1.centro
    row: 7
    col: 0
    width: 24
    height: 6
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
    explore: salida_cp_pt_inventario_lu_1
    listens_to_filters: []
    field: salida_cp_pt_inventario_lu_1.material
  - name: Centro
    title: Centro
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: cadena_suministro
    explore: salida_cp_pt_inventario_lu_1
    listens_to_filters: []
    field: salida_cp_pt_inventario_lu_1.Centro
