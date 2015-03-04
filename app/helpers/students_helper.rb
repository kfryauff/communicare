module StudentsHelper
  def sort_categories
    [["First Name", "given_name"], ["Last Name", "surname"],
      ["Date Joined", "joined_at"], ["Age", "age"]]
  end
end

