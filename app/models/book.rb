class Book < ApplicationRecord
	# booksのテーブルに関連したこと書くファイル

    # 制限をかける：カラム,制限内容（空白防止）
    validates :title, presence: true
    validates :body, presence: true
end

