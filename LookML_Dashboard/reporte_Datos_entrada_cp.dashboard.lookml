---
- dashboard: reporte_datos_de_entrada_cp
  title: Reporte Datos de entrada CP
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: pXhnfgY4lKPSdOf0GRuedi
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
  - title: Forecast
    name: Forecast
    model: cadena_suministro
    explore: res_vw_cp_forecast_completo
    type: looker_grid
    fields: [val_vw_datos_generales.material_desc, res_vw_cp_forecast_completo.sku,
      res_vw_cp_forecast_completo.count, res_vw_cp_forecast_completo.Fecha_creacion_week]
    pivots: [res_vw_cp_forecast_completo.Fecha_creacion_week]
    fill_fields: [res_vw_cp_forecast_completo.Fecha_creacion_week]
    sorts: [res_vw_cp_forecast_completo.Fecha_creacion_week, res_vw_cp_forecast_completo.count
        desc 0]
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
    hidden_pivots: {}
    defaults_version: 1
    minimum_column_width: 75
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", res_vw_cp_forecast_completo.sku, val_vw_datos_generales.material_desc,
      2023-10-02_res_vw_cp_forecast_completo.count, 2023-10-09_res_vw_cp_forecast_completo.count,
      2023-10-16_res_vw_cp_forecast_completo.count, 2023-10-23_res_vw_cp_forecast_completo.count,
      2023-10-30_res_vw_cp_forecast_completo.count, 2023-11-06_res_vw_cp_forecast_completo.count,
      2023-11-13_res_vw_cp_forecast_completo.count, 2023-11-20_res_vw_cp_forecast_completo.count,
      2023-11-27_res_vw_cp_forecast_completo.count, 2023-12-04_res_vw_cp_forecast_completo.count,
      2023-12-11_res_vw_cp_forecast_completo.count, 2023-12-18_res_vw_cp_forecast_completo.count]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      res_vw_cp_forecast_completo.count: Cantidad
    series_cell_visualizations:
      res_vw_cp_forecast_completo.count:
        is_active: false
    header_font_color: "#ffff"
    header_background_color: "#154360"
    listen:
      SKU: res_vw_cp_forecast_completo.sku
    row: 19
    col: 0
    width: 24
    height: 5
  - title: Pedidos venta
    name: Pedidos venta
    model: cadena_suministro
    explore: vw_modelo_pedidos_de_venta
    type: looker_grid
    fields: [vw_modelo_pedidos_de_venta.n_pedido, vw_modelo_pedidos_de_venta.Total_cantidad,
      vw_modelo_pedidos_de_venta.cliente, vw_modelo_pedidos_de_venta.sku, vw_modelo_pedidos_de_venta.descibe_sku,
      vw_modelo_pedidos_de_venta.centro, vw_modelo_pedidos_de_venta.Fecha_date]
    sorts: [vw_modelo_pedidos_de_venta.Total_cantidad desc 0]
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
    column_order: ["$$$_row_numbers_$$$", vw_modelo_pedidos_de_venta.Fecha_date, vw_modelo_pedidos_de_venta.n_pedido,
      vw_modelo_pedidos_de_venta.cliente, vw_modelo_pedidos_de_venta.sku, vw_modelo_pedidos_de_venta.descibe_sku,
      vw_modelo_pedidos_de_venta.centro, vw_modelo_pedidos_de_venta.Total_cantidad]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      vw_modelo_pedidos_de_venta.Total_cantidad: Cantidad
      vw_modelo_pedidos_de_venta.Fecha_date: Fecha
    series_cell_visualizations:
      vw_modelo_pedidos_de_venta.Total_cantidad:
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
    listen:
      SKU: vw_modelo_pedidos_de_venta.sku
    row: 2
    col: 0
    width: 24
    height: 6
  - title: Temporalidad Pedidos venta
    name: Temporalidad Pedidos venta
    model: cadena_suministro
    explore: vw_modelo_pedidos_de_venta
    type: looker_grid
    fields: [vw_modelo_pedidos_de_venta.Total_cantidad, vw_modelo_pedidos_de_venta.sku,
      vw_modelo_pedidos_de_venta.Fecha_week, vw_modelo_pedidos_de_venta.descibe_sku]
    pivots: [vw_modelo_pedidos_de_venta.Fecha_week]
    fill_fields: [vw_modelo_pedidos_de_venta.Fecha_week]
    sorts: [vw_modelo_pedidos_de_venta.Fecha_week, vw_modelo_pedidos_de_venta.Total_cantidad
        desc 0]
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
      vw_modelo_pedidos_de_venta.Total_cantidad: Cantidad
    series_cell_visualizations:
      vw_modelo_pedidos_de_venta.Total_cantidad:
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
    hidden_pivots: {}
    listen:
      SKU: vw_modelo_pedidos_de_venta.sku
    row: 14
    col: 0
    width: 24
    height: 5
  - title: Inventario de producto terminado
    name: Inventario de producto terminado
    model: cadena_suministro
    explore: res_vw_lp_inventario_insumos
    type: looker_grid
    fields: [res_vw_lp_inventario_insumos.sku, val_vw_datos_generales.material_desc,
      res_vw_lp_inventario_insumos.centro, res_vw_lp_inventario_insumos.Total_stock_libre_utilizacion,
      res_vw_lp_inventario_insumos.Total_stock_seguridad]
    filters:
      res_vw_lp_inventario_insumos.Total_stock: ">0"
    sorts: [res_vw_lp_inventario_insumos.sku]
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
      res_vw_lp_inventario_insumos.Total_stock_libre_utilizacion:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    defaults_version: 1
    column_order: ["$$$_row_numbers_$$$", res_vw_lp_inventario_insumos.sku, val_vw_datos_generales.material_desc,
      res_vw_lp_inventario_insumos.sociedad, res_vw_lp_inventario_insumos.centro,
      res_vw_lp_inventario_insumos.Total_stock_libre_utilizacion, res_vw_lp_inventario_insumos.Total_stock_seguridad,
      res_vw_lp_inventario_insumos.insumo_material, res_vw_lp_inventario_insumos.Insumo_material_Descripcion,
      res_vw_lp_inventario_insumos.Total_insumo_stock_libre_utilizacion, res_vw_lp_inventario_insumos.Total_insumo_stock_seguridad]
    hidden_pivots: {}
    listen:
      SKU: res_vw_lp_inventario_insumos.sku
    row: 24
    col: 0
    width: 24
    height: 7
  - title: New Tile
    name: New Tile
    model: cadena_suministro
    explore: res_vw_lp_precio_unitario
    type: single_value
    fields: [res_vw_lp_precio_unitario.precio_ponderado]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Precio Unitario Ponderado
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      SKU: res_vw_lp_precio_unitario.sku
    row: 53
    col: 16
    width: 6
    height: 3
  - title: New Tile
    name: New Tile (2)
    model: cadena_suministro
    explore: res_vw_lp_precio_unitario
    type: single_value
    fields: [res_vw_lp_precio_unitario.Total_unidades]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Unidades Vendidas
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      SKU: res_vw_lp_precio_unitario.sku
    row: 53
    col: 3
    width: 6
    height: 3
  - title: New Tile
    name: New Tile (3)
    model: cadena_suministro
    explore: res_vw_lp_precio_unitario
    type: single_value
    fields: [res_vw_lp_precio_unitario.Total_ventas]
    filters:
      res_vw_lp_precio_unitario.material: ''
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Costo Total de Ventas
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      SKU: res_vw_lp_precio_unitario.sku
    row: 53
    col: 9
    width: 7
    height: 3
  - name: Precio
    type: text
    title_text: Precio
    subtitle_text: ''
    body_text: "<div style=\"border-radius: 5px; padding: 5px 10px; background: #154360;\
      \ height: 60px; color: red;\">\n\t<nav style=\"font-size: 18px;\">\n\t\t\n\t\
      \t\n\t\t\n\t</nav>\n</div>"
    row: 44
    col: 0
    width: 24
    height: 2
  - title: Costo de Productos
    name: Costo de Productos
    model: cadena_suministro
    explore: res_vw_cadena_suministro_datos_generales
    type: looker_grid
    fields: [res_vw_cadena_suministro_datos_generales.Total_precio_absorbente, res_vw_cadena_suministro_datos_generales.Total_precio_estandar,
      res_vw_cadena_suministro_datos_generales.Total_precio_medio_variable, res_vw_cadena_suministro_datos_generales.sku,
      res_vw_cadena_suministro_datos_generales.centro, res_vw_cadena_suministro_datos_generales.indicador_control_precios,
      res_vw_cadena_suministro_datos_generales.sociedad]
    filters:
      res_vw_cadena_suministro_datos_generales.Total_precio_absorbente: ">0"
    sorts: [res_vw_cadena_suministro_datos_generales.Total_precio_absorbente desc
        0]
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
    column_order: ["$$$_row_numbers_$$$", res_vw_cadena_suministro_datos_generales.sku,
      res_vw_cadena_suministro_datos_generales.sociedad, res_vw_cadena_suministro_datos_generales.centro,
      res_vw_cadena_suministro_datos_generales.Total_precio_estandar, res_vw_cadena_suministro_datos_generales.Total_precio_medio_variable,
      res_vw_cadena_suministro_datos_generales.Total_precio_absorbente, res_vw_cadena_suministro_datos_generales.indicador_control_precios]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      res_vw_cadena_suministro_datos_generales.Total_precio_absorbente:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    defaults_version: 1
    listen:
      SKU: res_vw_cadena_suministro_datos_generales.sku
    row: 56
    col: 0
    width: 24
    height: 6
  - title: Pedidos
    name: Pedidos
    model: cadena_suministro
    explore: vw_modelo_pedidos_de_venta
    type: looker_column
    fields: [vw_modelo_pedidos_de_venta.n_pedido, vw_modelo_pedidos_de_venta.Total_cantidad]
    sorts: [vw_modelo_pedidos_de_venta.Total_cantidad desc 0]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      vw_modelo_pedidos_de_venta.Total_cantidad: "#EA4335"
    series_labels:
      vw_modelo_pedidos_de_venta.Total_cantidad: Cantidad
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      vw_modelo_pedidos_de_venta.Total_cantidad:
        is_active: false
    table_theme: white
    enable_conditional_formatting: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen:
      SKU: vw_modelo_pedidos_de_venta.sku
    row: 8
    col: 0
    width: 24
    height: 6
  - title: Precios
    name: Precios
    model: cadena_suministro
    explore: res_vw_lp_precio_unitario
    type: looker_grid
    fields: [res_vw_lp_precio_unitario.Total_ventas, res_vw_lp_precio_unitario.Total_unidades,
      res_vw_lp_precio_unitario.Total_precio_unitario, res_vw_lp_precio_unitario.solicitante]
    sorts: [res_vw_lp_precio_unitario.Total_ventas desc 0]
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", res_vw_lp_precio_unitario.solicitante, res_vw_lp_precio_unitario.Total_unidades,
      res_vw_lp_precio_unitario.Total_precio_unitario, res_vw_lp_precio_unitario.precio_ponderado,
      res_vw_lp_precio_unitario.Total_ventas]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      res_vw_lp_precio_unitario.Total_unidades: Unidades vendidas
      res_vw_lp_precio_unitario.solicitante: Precio Unitario
      res_vw_lp_precio_unitario.Total_ventas: Precio Total
      res_vw_lp_precio_unitario.Total_precio_unitario: Precio Unitario
    series_cell_visualizations:
      res_vw_lp_precio_unitario.Total_ventas:
        is_active: false
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#5D6D7E",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Precio Unitario Ponderado
    hidden_pivots: {}
    defaults_version: 1
    listen:
      SKU: res_vw_lp_precio_unitario.sku
    row: 46
    col: 1
    width: 23
    height: 7
  - title: Inventario Insumos
    name: Inventario Insumos
    model: cadena_suministro
    explore: res_tb_sku_componentes
    type: looker_grid
    fields: [res_tb_sku_componentes.centro, res_tb_sku_componentes.componente_e1,
      res_tb_sku_componentes.componente_u1, res_tb_sku_componentes.sku, res_tb_sku_componentes.componente_n1]
    sorts: [res_tb_sku_componentes.sku desc]
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
    column_order: ["$$$_row_numbers_$$$", res_tb_sku_componentes.sku, res_tb_sku_componentes.centro,
      res_tb_sku_componentes.componente_n1, res_tb_sku_componentes.componente_e1,
      res_tb_sku_componentes.componente_u1]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      res_tb_sku_componentes.componente_e1: Stock_Libre_Utilizacion
      res_tb_sku_componentes.componente_u1: Unidad de Medida
      res_tb_sku_componentes.componente_n1: Insumos
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
      SKU: res_tb_sku_componentes.sku
    row: 31
    col: 0
    width: 24
    height: 6
  - title: Costos Sociedad
    name: Costos Sociedad
    model: cadena_suministro
    explore: res_vw_cadena_suministro_datos_generales
    type: looker_grid
    fields: [res_vw_cadena_suministro_datos_generales.sociedad, res_vw_cadena_suministro_datos_generales.Total_precio_absorbente]
    filters:
      res_vw_cadena_suministro_datos_generales.Total_precio_absorbente: ">0"
    sorts: [res_vw_cadena_suministro_datos_generales.Total_precio_absorbente desc
        0]
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
    column_order: ["$$$_row_numbers_$$$", res_vw_cadena_suministro_datos_generales.sku,
      res_vw_cadena_suministro_datos_generales.sociedad, res_vw_cadena_suministro_datos_generales.centro,
      res_vw_cadena_suministro_datos_generales.Total_precio_estandar, res_vw_cadena_suministro_datos_generales.Total_precio_medio_variable,
      res_vw_cadena_suministro_datos_generales.Total_precio_absorbente, res_vw_cadena_suministro_datos_generales.indicador_control_precios]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      res_vw_cadena_suministro_datos_generales.Total_precio_absorbente:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      SKU: res_vw_cadena_suministro_datos_generales.sku
    row: 62
    col: 0
    width: 24
    height: 6
  - title: Cantidades Requeridas para Fabricación de producto terminado
    name: Cantidades Requeridas para Fabricación de producto terminado
    model: cadena_suministro
    explore: res_tb_sku_componentes_vertical
    type: looker_grid
    fields: [res_tb_sku_componentes_vertical.sku, res_tb_sku_componentes_vertical.nivel,
      res_tb_sku_componentes_vertical.componente, res_tb_sku_componentes_vertical.componente_u1,
      res_tb_sku_componentes_vertical.Cantidad]
    filters: {}
    sorts: [res_tb_sku_componentes_vertical.sku, res_tb_sku_componentes_vertical.nivel,
      res_tb_sku_componentes_vertical.componente]
    subtotals: [res_tb_sku_componentes_vertical.sku, res_tb_sku_componentes_vertical.nivel,
      res_tb_sku_componentes_vertical.componente]
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
    column_order: [res_tb_sku_componentes_vertical.sku, res_tb_sku_componentes_vertical.centro,
      res_tb_sku_componentes_vertical.nivel, res_tb_sku_componentes_vertical.componente,
      res_tb_sku_componentes_vertical.componente_u1, res_tb_sku_componentes_vertical.Cantidad]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      res_tb_sku_componentes_vertical.Cantidad:
        is_active: true
      res_tb_sku_componentes_vertical.nivel:
        is_active: false
    series_collapsed:
      res_tb_sku_componentes_vertical.sku: true
      res_tb_sku_componentes_vertical.nivel: true
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
    hidden_pivots: {}
    listen:
      SKU: res_tb_sku_componentes_vertical.sku
    row: 37
    col: 0
    width: 24
    height: 7
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
      options: []
    model: cadena_suministro
    explore: vw_consolidado_codigos_sku
    listens_to_filters: []
    field: vw_consolidado_codigos_sku.sku
