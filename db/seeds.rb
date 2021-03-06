
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/budget')

# MERCHANTS

tesco = Merchant.new({
  'name' => 'Tesco'
  })

aldi = Merchant.new({
  'name' => 'Aldi'
  })
lothian_buses = Merchant.new({
  'name' => 'Lothian Buses'
  })

scotrail = Merchant.new({
  'name' => 'Scotrail'
  })

tesco.save
lothian_buses.save
scotrail.save
aldi.save

# TAGS

food = Tag.new({
  'category' => 'food'
  })

transport = Tag.new({
  'category' => 'transport'
  })

food.save
transport.save

# TRANSACTIONS

transaction1 = Transaction.new({
  'description' => 'weekly shopping',
  'merchant_id' => aldi.id,
  'tag_id' => food.id,
  'amount' => 23.17,
  'transaction_date' => '2018-07-30'
  })

transaction2 = Transaction.new({
  'description' => 'monthly Riddacard',
  'merchant_id' => lothian_buses.id,
  'tag_id' => transport.id,
  'amount' => 53,
  'transaction_date' => '2018-08-03'
  })

transaction1.save
transaction2.save

# BUDGETS

budget1 = Budget.new({
  'name' => 'August',
  'amount' => 500,
  'start_date' => '2018/08/01',
  'finish_date' => '2018/08/31'
})

budget1.save
