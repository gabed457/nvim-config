-- Terraform/Infrastructure as Code
return {
  {
    'hashivim/vim-terraform',
    ft = { 'terraform', 'tf', 'terraform-vars', 'hcl' },
    config = function()
      vim.g.terraform_fmt_on_save = 1
      vim.g.terraform_align = 1
    end,
  },
}
