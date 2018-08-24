class Tag
  attr_reader :id
  attr_accessor :category

  def initialize(info)
    @category = info['category']
    @id = info['id'].to_i if info['id']

  end

  def save
    sql = "INSERT INTO tags
    (category)
    VALUES
    ($1)
    RETURNING id
    "
    values =[@category]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update
    sql = "UPDATE tags
    SET
    category = $2
    WHERE id = $1
    "
    values = [@id, @category]
    results = SqlRunner.run(sql, values)
  end

  
end
