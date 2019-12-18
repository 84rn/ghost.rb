# Classes 

These classes make up the MVC model of the app. Suggestions are welcome.

## Model

| SettingsAggregator  
|---
| -country_map: Map<br> -type_list: Array<br> 
| +initialize()<br> +get_country_list()<br> +get_country_cc()<br> +get_city_list()<br> +get_cities_in()<br> +get_type_list()<br> +get_country_by_code()

| SettingsLoader
|---
| -url: String -settings: SettingsAggregator
| +load_data()
| +get_data()


| ConnectionParameters 
|---
| -country: String<br> -city: String<br> -type: String
| +initialize()<br> +get_cc()<br> +get_country()<br> +get_city()<br> +get_type()<br> +get_connection_string()<br>



| ConnectionSettings
|---
| -country: String<br> -city: String<br> -type: String<br>
| +initialize()<br> +get_country()<br> +set_country()<br> +get_city()<br> +set_city<br> +get_type()<br> +set_type<br> +get_connection_parameters() +set_connection_parameters()

## Controller

| Application
|---
| -settings_bank: SettingsAggregator<br> -settings: ConnectionSettings
| 



## View
