---
- dashboard: prediccin_arima_plus_v4
  title: Predicción Arima plus v4
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: GSeKRmnfzzJxRzqaLSRt9r
  elements:
  - title: Arima plus v4
    name: Arima plus v4
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    type: looker_area
    fields: [arima_forecast_completo_lp_2.Total_cantidad, arima_forecast_completo_lp_2.fecha_month,
      arima_forecast_completo_lp_2.total_prediction_interval_lower_bound, arima_forecast_completo_lp_2.Total_prediction_interval_upper_bound]
    fill_fields: [arima_forecast_completo_lp_2.fecha_month]
    sorts: [arima_forecast_completo_lp_2.fecha_month]
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
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Sku: arima_forecast_completo_lp_2.Sku
      centro: arima_forecast_completo_lp_2.centro
      Mercado: arima_forecast_completo_lp_2.Mercado
      cliente: arima_forecast_completo_lp_2.Cliente
    row: 11
    col: 0
    width: 24
    height: 12
  - title: New Tile
    name: New Tile
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    type: single_value
    fields: [arima_medicion_lp.Total_mean_absolute_error]
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
    custom_color: "#fff"
    single_value_title: Mean absolute error
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      cliente: arima_forecast_completo_lp_2.Cliente
      Mercado: arima_forecast_completo_lp_2.Mercado
      centro: arima_forecast_completo_lp_2.centro
      Sku: arima_forecast_completo_lp_2.Sku
    row: 8
    col: 0
    width: 4
    height: 3
  - title: New Tile
    name: New Tile (2)
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    type: single_value
    fields: [arima_medicion_lp.Total_mean_absolute_percentage_error]
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
    custom_color: "#fff"
    single_value_title: Mean absolute percentage error
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      cliente: arima_forecast_completo_lp_2.Cliente
      Mercado: arima_forecast_completo_lp_2.Mercado
      centro: arima_forecast_completo_lp_2.centro
      Sku: arima_forecast_completo_lp_2.Sku
    row: 8
    col: 9
    width: 5
    height: 3
  - title: New Tile
    name: New Tile (3)
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    type: single_value
    fields: [arima_medicion_lp.Total_mean_squared_error]
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
    custom_color: "#fff"
    single_value_title: Mean squared error
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      cliente: arima_forecast_completo_lp_2.Cliente
      Mercado: arima_forecast_completo_lp_2.Mercado
      centro: arima_forecast_completo_lp_2.centro
      Sku: arima_forecast_completo_lp_2.Sku
    row: 8
    col: 19
    width: 5
    height: 3
  - title: New Tile
    name: New Tile (4)
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    type: single_value
    fields: [arima_medicion_lp.Total_root_mean_squared_error]
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
    custom_color: "#fff"
    single_value_title: Root mean squared error
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      cliente: arima_forecast_completo_lp_2.Cliente
      Mercado: arima_forecast_completo_lp_2.Mercado
      centro: arima_forecast_completo_lp_2.centro
      Sku: arima_forecast_completo_lp_2.Sku
    row: 8
    col: 4
    width: 5
    height: 3
  - title: New Tile
    name: New Tile (5)
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    type: single_value
    fields: [arima_medicion_lp.Total_symmetric_mean_absolute_percentage_error]
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
    custom_color: "#fff"
    single_value_title: Symmetric mean absolute percentage error
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      cliente: arima_forecast_completo_lp_2.Cliente
      Mercado: arima_forecast_completo_lp_2.Mercado
      centro: arima_forecast_completo_lp_2.centro
      Sku: arima_forecast_completo_lp_2.Sku
    row: 8
    col: 14
    width: 5
    height: 3
  - title: New Tile
    name: New Tile (6)
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    type: single_value
    fields: [val_vw_datos_generales.Metaria_descripcion]
    sorts: [val_vw_datos_generales.Metaria_descripcion]
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
    custom_color: "#80868B"
    single_value_title: Sku
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    defaults_version: 1
    listen:
      cliente: arima_forecast_completo_lp_2.Cliente
      Mercado: arima_forecast_completo_lp_2.Mercado
      centro: arima_forecast_completo_lp_2.centro
      Sku: arima_forecast_completo_lp_2.Sku
    row: 2
    col: 0
    width: 24
    height: 3
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
  - title: Mercado
    name: Mercado
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    type: looker_wordcloud
    fields: [arima_forecast_completo_lp_2.count, arima_forecast_completo_lp_2.Mercado]
    sorts: [arima_forecast_completo_lp_2.count desc 0]
    limit: 500
    column_limit: 50
    color_application: undefined
    custom_color_enabled: true
    custom_color: "#80868B"
    show_single_value_title: true
    single_value_title: Sku
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      cliente: arima_forecast_completo_lp_2.Cliente
      Mercado: arima_forecast_completo_lp_2.Mercado
      centro: arima_forecast_completo_lp_2.centro
      Sku: arima_forecast_completo_lp_2.Sku
    row: 5
    col: 7
    width: 10
    height: 3
  - title: Cliente
    name: Cliente
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    type: looker_wordcloud
    fields: [arima_forecast_completo_lp_2.count, arima_forecast_completo_lp_2.Cliente]
    sorts: [arima_forecast_completo_lp_2.count desc 0]
    limit: 500
    column_limit: 50
    color_application: undefined
    custom_color_enabled: true
    custom_color: "#80868B"
    show_single_value_title: true
    single_value_title: Sku
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      cliente: arima_forecast_completo_lp_2.Cliente
      Mercado: arima_forecast_completo_lp_2.Mercado
      centro: arima_forecast_completo_lp_2.centro
      Sku: arima_forecast_completo_lp_2.Sku
    row: 5
    col: 17
    width: 7
    height: 3
  - title: Centro
    name: Centro
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    type: looker_wordcloud
    fields: [arima_forecast_completo_lp_2.centro, arima_forecast_completo_lp_2.count]
    sorts: [arima_forecast_completo_lp_2.count desc 0]
    limit: 500
    column_limit: 50
    color_application: undefined
    custom_color_enabled: true
    custom_color: "#80868B"
    show_single_value_title: true
    single_value_title: Sku
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      cliente: arima_forecast_completo_lp_2.Cliente
      Mercado: arima_forecast_completo_lp_2.Mercado
      centro: arima_forecast_completo_lp_2.centro
      Sku: arima_forecast_completo_lp_2.Sku
    row: 5
    col: 0
    width: 7
    height: 3
  filters:
  - name: Sku
    title: Sku
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    listens_to_filters: [centro, Mercado, cliente]
    field: arima_forecast_completo_lp_2.Sku
  - name: centro
    title: centro
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    listens_to_filters: [Sku, Mercado, cliente]
    field: arima_forecast_completo_lp_2.centro
  - name: Mercado
    title: Mercado
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    listens_to_filters: [Sku, centro, cliente]
    field: arima_forecast_completo_lp_2.Mercado
  - name: cliente
    title: cliente
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cadena_suministro
    explore: arima_forecast_completo_lp_2
    listens_to_filters: [Sku, centro, Mercado]
    field: arima_forecast_completo_lp_2.Cliente
