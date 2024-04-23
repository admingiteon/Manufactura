view: indexes_almacenes_excedidos_simulacion {
    derived_table: {
      sql:
      WITH TotalAlmacenes AS (
    SELECT DISTINCT centro
    FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_almacenes_excedidos_sm`
),
AlmacenesExcedidos AS (
    SELECT DISTINCT centro
    FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_almacenes_excedidos_sm`
    WHERE porcentaje_ocupacion >= 100 OR porcentaje_ocupacion < 0
),
AlmacenesOcupados AS (
    SELECT DISTINCT centro
    FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_almacenes_excedidos_sm`
    WHERE porcentaje_ocupacion >= 80
),
AlmacenesNoExcedidos AS (
    SELECT centro
    FROM TotalAlmacenes
    WHERE centro NOT IN (SELECT centro FROM AlmacenesExcedidos)
),
AlmacenesConOcupacionMenorA80 AS (
    SELECT centro
    FROM TotalAlmacenes
    WHERE centro NOT IN (SELECT centro FROM AlmacenesOcupados)
)

SELECT 'total_centros_excedidos' AS concepto,
       (SELECT COUNT(*) FROM AlmacenesExcedidos) AS quantity
UNION ALL
SELECT 'total_centros_con_ocupacion_mayor_a_80' AS concepto,
       (SELECT COUNT(*) FROM AlmacenesOcupados) AS quantity
UNION ALL
SELECT 'Total' AS concepto,
       (SELECT COUNT(*) FROM TotalAlmacenes) AS quantity
UNION ALL
SELECT 'total_centros_no_excedidos' AS concepto,
       (SELECT COUNT(*) FROM AlmacenesNoExcedidos) AS quantity
UNION ALL
SELECT 'total_centros_con_ocupacion_menor_a_80' AS concepto,
       (SELECT COUNT(*) FROM AlmacenesConOcupacionMenorA80) AS quantity
;;
    }

    dimension: concepto {
      type: string
      sql: ${TABLE}.concepto ;;

    }

    measure: quantity {
      type: sum
      sql: ${TABLE}.quantity ;;
      drill_fields: [concepto]
      link: {
        label: "Detalle Ocupación"
        url: "{% assign vis_config = '{
            \"show_view_names\":false,
            \"show_row_numbers\":true,
            \"transpose\":false,
            \"truncate_text\":true,
            \"hide_totals\":false,
            \"hide_row_totals\":false,
            \"size_to_fit\":true,
            \"table_theme\":\"white\",
            \"limit_displayed_rows\":false,
            \"enable_conditional_formatting\":false,
            \"header_text_alignment\":\"left\",
            \"header_font_size\":\"12\",
            \"rows_font_size\":\"12\",
            \"conditional_formatting_include_totals\":false,
            \"conditional_formatting_include_nulls\":false,
            \"show_sql_query_menu_options\":false,
            \"show_totals\":true,\"show_row_totals\":true,
            \"truncate_header\":false,
            \"minimum_column_width\":75,
            \"series_cell_visualizations\":{\"almacenes_excedidos_simulacion.capacidad\":{\"is_active\":true}},
            \"type\":\"looker_grid\",
            \"defaults_version\":1}' %}

        {{ link }}&vis_config={{ vis_config | encode_uri}}&fields=almacenes_excedidos_simulacion.centro,almacenes_excedidos_simulacion.capacidad,almacenes_excedidos_simulacion.escenario_id&sorts=almacenes_excedidos_simulacion.capacidad desc 0&limit=500&column_limit=50"
      }
    }


  }
