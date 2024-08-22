class AddTimestampsToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_timestamps :players, null: true  # Agrega las columnas `created_at` y `updated_at`

    # Actualiza las columnas `created_at` y `updated_at` para los registros existentes
    Player.update_all(created_at: Time.current, updated_at: Time.current)

    # Cambia las columnas `created_at` y `updated_at` para que no permitan valores nulos
    change_column_null :players, :created_at, false
    change_column_null :players, :updated_at, false
  end
end

