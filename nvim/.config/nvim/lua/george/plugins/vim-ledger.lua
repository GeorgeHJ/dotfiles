return {
  "ledger/vim-ledger",
  version = false,
  ft = "ledger",
  init = function()
    vim.g.ledger_bin = "hledger"
    vim.g.ledger_fuzzy_account_completion = 1
    vim.g.ledger_date_format = "%Y-%m-%d"
    vim.g.ledger_align_at = 70
  end,
  opt = {},
}
