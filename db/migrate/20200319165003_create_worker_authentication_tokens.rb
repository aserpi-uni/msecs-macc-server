class CreateWorkerAuthenticationTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :worker_authentication_tokens do |t|
      t.string :body
      t.references :user, null: false, foreign_key: { to_table: :workers }
      t.datetime :last_used_at
      t.integer :expires_in
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
    add_index :worker_authentication_tokens, :body
  end
end
