class AddTransactableToTransactionLog < ActiveRecord::Migration
  def change
    add_reference :transaction_logs, :transactable, polymorphic: true, index: { name: 'index_transaction_logs_on_transactable_type_n_transactable_id' }
  end
end
