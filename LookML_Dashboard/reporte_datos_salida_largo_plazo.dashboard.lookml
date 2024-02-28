---
- dashboard: reporte_de_datos_de_salida_largo_plazo
  title: Reporte de Datos de Salida (Largo Plazo)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: ODD3QQpW2B65rQ4QlDQilo
  elements:
  - title: Necesidades de Fabricación
    name: Necesidades de Fabricación
    model: cadena_suministro
    explore: salidas_lp_fabricacion
    type: looker_grid
    fields: [salidas_lp_fabricacion.material, salidas_lp_fabricacion.centro, salidas_lp_fabricacion.cantidad_requerida,
      salidas_lp_fabricacion.fecha_date, salidas_lp_fabricacion.fecha_inicio_produccion_date]
    filters:
      salidas_lp_fabricacion.cantidad_requerida: ">0"
    sorts: [salidas_lp_fabricacion.fecha_date]
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
    column_order: ["$$$_row_numbers_$$$", salidas_lp_fabricacion.fecha_date, salidas_lp_fabricacion.material,
      salidas_lp_fabricacion.centro, salidas_lp_fabricacion.cantidad_requerida, salidas_lp_fabricacion.fecha_inicio_produccion_date]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      salidas_lp_fabricacion.fecha_inicio_produccion_week: Fecha inicio producción
      salidas_lp_fabricacion.fecha_date: Fecha
      salidas_lp_fabricacion.fecha_inicio_produccion_date: Fecha Inicio producción
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Material: salidas_lp_fabricacion.material
      Centro: salidas_lp_fabricacion.centro
    row: 8
    col: 0
    width: 24
    height: 6
  - title: Capacidad de Fabricación
    name: Capacidad de Fabricación
    model: cadena_suministro
    explore: salidas_lp_pt_fabricacion_1
    type: looker_grid
    fields: [salidas_lp_pt_fabricacion_1.fecha_week, salidas_lp_pt_fabricacion_1.Material,
      salidas_lp_pt_fabricacion_1.Centro, salidas_lp_pt_fabricacion_1.prioridad, salidas_lp_pt_fabricacion_1.tipo,
      salidas_lp_pt_fabricacion_1.Totalcantidad_requerida, salidas_lp_pt_fabricacion_1.Total_cantidad_producible]
    sorts: [salidas_lp_pt_fabricacion_1.prioridad desc]
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
      salidas_lp_pt_fabricacion_1.fecha_week: Fecha
    series_cell_visualizations:
      salidas_lp_pt_fabricacion_1.Totalcantidad_requerida:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    defaults_version: 1
    column_order: ["$$$_row_numbers_$$$", salidas_lp_pt_fabricacion_1.fecha_week,
      salidas_lp_pt_fabricacion_1.Material, salidas_lp_pt_fabricacion_1.Centro, salidas_lp_pt_fabricacion_1.Totalcantidad_requerida,
      salidas_lp_pt_fabricacion_1.Total_cantidad_producible, salidas_lp_pt_fabricacion_1.prioridad,
      salidas_lp_pt_fabricacion_1.tipo]
    listen:
      Material: salidas_lp_pt_fabricacion_1.Material
      Centro: salidas_lp_pt_fabricacion_1.Centro
    row: 14
    col: 0
    width: 24
    height: 6
  - title: Inventario de Insumos
    name: Inventario de Insumos
    model: cadena_suministro
    explore: salidas_lp_insumo_inventario_1
    type: looker_grid
    fields: [salidas_lp_insumo_inventario_1.Material, salidas_lp_insumo_inventario_1.Centro,
      salidas_lp_insumo_inventario_1.componente, salidas_lp_insumo_inventario_1.fecha_inicio_produccion_week,
      salidas_lp_insumo_inventario_1.posicion_actual, salidas_lp_insumo_inventario_1.fecha_date,
      salidas_lp_insumo_inventario_1.necesidad, salidas_lp_insumo_inventario_1.prioridad,
      salidas_lp_insumo_inventario_1.unidad_de_medida]
    sorts: [salidas_lp_insumo_inventario_1.Material]
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
    column_order: ["$$$_row_numbers_$$$", salidas_lp_insumo_inventario_1.fecha_date,
      salidas_lp_insumo_inventario_1.Material, salidas_lp_insumo_inventario_1.Centro,
      salidas_lp_insumo_inventario_1.componente, salidas_lp_insumo_inventario_1.fecha_inicio_produccion_week,
      salidas_lp_insumo_inventario_1.posicion_actual, salidas_lp_insumo_inventario_1.unidad_de_medida,
      salidas_lp_insumo_inventario_1.prioridad, salidas_lp_insumo_inventario_1.necesidad]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      salidas_lp_insumo_inventario_1.fecha_inicio_produccion_week: Fecha Inicio Producción
      salidas_lp_insumo_inventario_1.fecha_orden_de_compra_week: Fecha orden de compra
      salidas_lp_insumo_inventario_1.fecha_date: Periodo
    header_font_color: "#fff"
    header_background_color: "#154360"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Material: salidas_lp_insumo_inventario_1.Material
      Centro: salidas_lp_insumo_inventario_1.Centro
    row: 20
    col: 0
    width: 24
    height: 5
  - title: Compras de Insumos
    name: Compras de Insumos
    model: cadena_suministro
    explore: salidas_lp_insumo_compras_1
    type: looker_grid
    fields: [salidas_lp_insumo_compras_1.Material, salidas_lp_insumo_compras_1.Centro,
      salidas_lp_insumo_compras_1.componente, salidas_lp_insumo_compras_1.fecha_inicio_produccion_week,
      salidas_lp_insumo_compras_1.fecha_orden_de_compra_week, salidas_lp_insumo_compras_1.cantidad_requerida,
      res_vw_cadena_suministro_datos_generales.unidad_de_medida, res_vw_cadena_suministro_datos_generales.plazo_de_entrega,
      res_vw_cadena_suministro_datos_generales.tiempo_tratamiento_entrada_mercancias,
      salidas_lp_insumo_inventario_1.Total_cantidad_requerida_Insumo]
    sorts: [salidas_lp_insumo_compras_1.fecha_inicio_produccion_week desc]
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
      salidas_lp_insumo_compras_1.fecha_inicio_produccion_week: Fecha inicio Produccion
      salidas_lp_insumo_compras_1.fecha_orden_de_compra_week: Fecha orden de compra
    series_cell_visualizations:
      salidas_lp_insumo_compras_1.Total_cantidad_requerida_Insumo:
        is_active: false
    header_font_color: "#ffff"
    header_background_color: "#154360"
    defaults_version: 1
    listen:
      Material: salidas_lp_insumo_compras_1.Material
      Centro: salidas_lp_insumo_compras_1.Centro
    row: 25
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
  - title: Cantidad Requerida de Productos Terminados
    name: Cantidad Requerida de Productos Terminados
    model: cadena_suministro
    explore: lp_pt_inventario_lu_1_rec_2
    type: looker_grid
    fields: [lp_pt_inventario_lu_1_rec_2.fecha_date, lp_pt_inventario_lu_1_rec_2.centro,
      lp_pt_inventario_lu_1_rec_2.Total_cantidad_requerida, lp_pt_inventario_lu_1_rec_2.Total_posicion_actual,
      lp_pt_inventario_lu_1_rec_2.stock_seguridad, lp_pt_inventario_lu_1_rec_2.ventas,
      lp_pt_inventario_lu_1_rec_2.material, lp_pt_inventario_lu_1_rec_2.tamano_lote_fabricacion]
    filters:
      lp_pt_inventario_lu_1_rec_2.Total_posicion_actual: NOT NULL
    sorts: [lp_pt_inventario_lu_1_rec_2.fecha_date]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [lp_pt_inventario_lu_1_rec_2.material, lp_pt_inventario_lu_1_rec_2.fecha_date,
      lp_pt_inventario_lu_1_rec_2.centro, lp_pt_inventario_lu_1_rec_2.ventas, lp_pt_inventario_lu_1_rec_2.Total_posicion_actual,
      lp_pt_inventario_lu_1_rec_2.Total_cantidad_requerida, lp_pt_inventario_lu_1_rec_2.tamano_lote_fabricacion,
      lp_pt_inventario_lu_1_rec_2.stock_seguridad]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      lp_pt_inventario_lu_1_rec_2.tamano_lote_fabricacion: Tamaño Lote Fabricación
    series_column_widths:
      lp_pt_inventario_lu_1_rec_2.fecha_date: 215
    series_cell_visualizations:
      lp_pt_inventario_lu_1_rec_2.Total_cantidad_requerida:
        is_active: false
    header_font_color: "#fafcff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 31
    col: 0
    width: 24
    height: 6
  - title: Posición de inventario inicial
    name: Posición de inventario inicial
    model: cadena_suministro
    explore: salidas_lp_pt_inventario_lu_1
    type: looker_grid
    fields: [salidas_lp_pt_inventario_lu_1.material, salidas_lp_pt_inventario_lu_1.fecha_string,
      salidas_lp_pt_inventario_lu_1.centro, salidas_lp_pt_inventario_lu_1.ventas,
      salidas_lp_pt_inventario_lu_1.Total_posicion_actual, salidas_lp_pt_inventario_lu_1.stock_seguridad,
      salidas_lp_pt_inventario_lu_1.Total_cantidad_requerida, salidas_lp_pt_inventario_lu_1.tamano_lote_fabricacion]
    filters:
      salidas_lp_pt_inventario_lu_1.material: '000000000004000244'
      salidas_lp_pt_inventario_lu_1.centro: DN08
    sorts: [salidas_lp_pt_inventario_lu_1.fecha_string]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
      salidas_lp_pt_inventario_lu_1.fecha_string: Fecha
    series_cell_visualizations:
      salidas_lp_pt_inventario_lu_1.ventas:
        is_active: false
    header_font_color: "#fff9f9"
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
    column_order: ["$$$_row_numbers_$$$", salidas_lp_pt_inventario_lu_1.material,
      salidas_lp_pt_inventario_lu_1.fecha_string, salidas_lp_pt_inventario_lu_1.centro,
      salidas_lp_pt_inventario_lu_1.ventas, salidas_lp_pt_inventario_lu_1.Total_posicion_actual,
      salidas_lp_pt_inventario_lu_1.Total_cantidad_requerida, salidas_lp_pt_inventario_lu_1.tamano_lote_fabricacion,
      salidas_lp_pt_inventario_lu_1.stock_seguridad]
    listen:
      Material: salidas_lp_pt_inventario_lu_1.Material
      Centro: salidas_lp_pt_inventario_lu_1.Centro
    row: 2
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
    explore: salidas_lp_pt_inventario_lu_1
    listens_to_filters: []
    field: salidas_lp_pt_inventario_lu_1.Material
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
    explore: salidas_lp_pt_inventario_lu_1
    listens_to_filters: []
    field: salidas_lp_pt_inventario_lu_1.Centro
