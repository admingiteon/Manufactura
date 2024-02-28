---
- dashboard: tablero_largo_plazo_trazabilidad_simulado_v2
  title: Tablero largo plazo (Trazabilidad) Simulado v2
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 1VBsqvAadewL1APzRUqU3X
  elements:
  - title: Tablero largo plazo (Trazabilidad) Simulado v2
    name: Tablero largo plazo (Trazabilidad) Simulado v2
    model: cadena_suministro
    explore: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios
    type: looker_grid
    fields: [tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.total_cantidad,
      tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.id_concepto, tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.concepto,
      tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.periodo]
    pivots: [tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.periodo]
    filters: {}
    sorts: [tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.periodo, tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.id_concepto]
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
    rows_font_size: '13'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Escenario ID: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.escenario_id
      Tipo Escenario: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.tipo_escenario
      Msterial: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.sku
      Centro: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.centro
      Periodo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.periodo
      Grupo articulo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.grupoarticulo
      Grupo articulo externo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.grupoarticuloexterno
    row: 4
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
  - title: Centro
    name: Centro
    model: cadena_suministro
    explore: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios
    type: looker_wordcloud
    fields: [tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.centro, tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.total_cantidad]
    filters:
      tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.id_concepto: ''
    sorts: [tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.total_cantidad
        desc 0]
    limit: 500
    column_limit: 50
    color_application: undefined
    custom_color_enabled: true
    custom_color: "#5D6D7E"
    show_single_value_title: true
    single_value_title: Sku
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#80868B",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: not null, value: !!null '',
        background_color: "#5D6D7E", font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '13'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Escenario ID: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.escenario_id
      Tipo Escenario: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.tipo_escenario
      Msterial: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.sku
      Centro: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.centro
      Periodo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.periodo
      Grupo articulo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.grupoarticulo
      Grupo articulo externo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.grupoarticuloexterno
    row: 2
    col: 19
    width: 5
    height: 2
  - title: Tablero largo plazo (Trazabilidad) Simulado v2 (Copy)
    name: Tablero largo plazo (Trazabilidad) Simulado v2 (Copy)
    model: cadena_suministro
    explore: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios
    type: single_value
    fields: [tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.sku_describe]
    filters:
      tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.id_concepto: ''
    sorts: [tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.sku_describe]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#5D6D7E"
    single_value_title: Sku
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '13'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Escenario ID: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.escenario_id
      Tipo Escenario: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.tipo_escenario
      Msterial: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.sku
      Centro: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.centro
      Periodo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.periodo
      Grupo articulo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.grupoarticulo
      Grupo articulo externo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.grupoarticuloexterno
    row: 2
    col: 4
    width: 15
    height: 2
  - title: Tablero largo plazo (Trazabilidad) Simulado v2 (Copy 2)
    name: Tablero largo plazo (Trazabilidad) Simulado v2 (Copy 2)
    model: cadena_suministro
    explore: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios
    type: single_value
    fields: [tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.sku_unicos]
    filters:
      tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.id_concepto: ''
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
    custom_color: "#5D6D7E"
    single_value_title: Sku
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#80868B",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: not null, value: !!null '',
        background_color: "#5D6D7E", font_color: "#fff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '13'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.total_cantidad:
        is_active: false
    header_font_color: "#fff"
    header_background_color: "#154360"
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Escenario ID: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.escenario_id
      Tipo Escenario: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.tipo_escenario
      Msterial: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.sku
      Centro: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.centro
      Periodo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.periodo
      Grupo articulo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.grupoarticulo
      Grupo articulo externo: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.grupoarticuloexterno
    row: 2
    col: 0
    width: 4
    height: 2
  filters:
  - name: Msterial
    title: Msterial
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cadena_suministro
    explore: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios
    listens_to_filters: [Centro, Periodo, Tipo Escenario, Grupo articulo externo]
    field: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.sku
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
    explore: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios
    listens_to_filters: [Msterial, Periodo, Tipo Escenario, Grupo articulo externo]
    field: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.centro
  - name: Periodo
    title: Periodo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios
    listens_to_filters: [Msterial, Centro, Tipo Escenario, Grupo articulo externo]
    field: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.periodo
  - name: Escenario ID
    title: Escenario ID
    type: field_filter
    default_value: '801'
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: cadena_suministro
    explore: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios
    listens_to_filters: []
    field: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.escenario_id
  - name: Tipo Escenario
    title: Tipo Escenario
    type: field_filter
    default_value: Simulado
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: cadena_suministro
    explore: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios
    listens_to_filters: [Msterial, Centro, Periodo, Grupo articulo externo]
    field: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.tipo_escenario
  - name: Grupo articulo
    title: Grupo articulo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cadena_suministro
    explore: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios
    listens_to_filters: [Msterial, Centro, Periodo, Tipo Escenario, Grupo articulo
        externo]
    field: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.grupoarticulo
  - name: Grupo articulo externo
    title: Grupo articulo externo
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cadena_suministro
    explore: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios
    listens_to_filters: [Msterial, Centro, Periodo, Tipo Escenario]
    field: tb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios.grupoarticuloexterno
