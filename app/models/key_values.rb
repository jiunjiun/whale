module KeyValues

  class Base < ActiveHash::Base
    def self.id_options
      all.map {|t| [t.name, t.id]}
    end

    def self.code_options
      all.map {|t| [t.name, t.code]}
    end

    def self.id_hash
      Hash[*(all.map{|t| [t.id, t.name]}.flatten)]
    end

    def self.code_hash
      Hash[*(all.map{|t| [t.code, t.name]}.flatten)]
    end

    def self.attributes
      all.map {|t| t.attributes }
    end

    def self.find_by_code(code)
      super(code.to_s)
    end
  end

  module User
    class Status < KeyValues::Base
      self.data = [
        {id:  1,  code: 'enable',  name: 'Enable'},

        {id: 99,  code: 'disable', name: 'Disable'},
      ]
    end

    class Gender < KeyValues::Base
      self.data = [
        {id: 1, code: 'male',   name: '男性'},
        {id: 2, code: 'female', name: '女性'},
      ]
    end
  end

  module Shark
    class Cetacea < KeyValues::Base
      self.data = [
        {id:  1, code: 'analytics',           name: '分析'},
        {id:  2, code: 'comic',               name: '漫畫'},
        {id:  3, code: 'communication',       name: '通訊'},
        {id:  4, code: 'design',              name: '設計'},
        {id:  5, code: 'developer_tools',     name: '開發者工具'},
        {id:  6, code: 'education',           name: '教育'},
        {id:  7, code: 'entertainment',       name: '娛樂'},
        {id:  8, code: 'file_anagement',      name: '檔案管理'},
        {id:  9, code: 'finance',             name: '財經'},
        {id: 10, code: 'food',                name: '食物'},
        {id: 11, code: 'games',               name: '遊戲'},
        {id: 12, code: 'health',              name: '健康'},
        {id: 13, code: 'marketing',           name: '行銷'},
        {id: 14, code: 'medical_treatment',   name: '醫療'},
        {id: 15, code: 'music',               name: '音樂'},
        {id: 16, code: 'news',                name: '新聞'},
        {id: 17, code: 'office_management',   name: '辦公室管理'},
        {id: 18, code: 'payments',            name: '付款'},
        {id: 19, code: 'personal',            name: '個人化'},
        {id: 20, code: 'photography',         name: '攝影'},
        {id: 21, code: 'pregnancy_parenting', name: '懷孕與育兒'},
        {id: 22, code: 'productivity',        name: '生產力'},
        {id: 23, code: 'security',            name: '安全'},
        {id: 24, code: 'shopping',            name: '購物'},
        {id: 25, code: 'social',              name: '社交'},
        {id: 26, code: 'sports',              name: '運動'},
        {id: 27, code: 'task Management',     name: '任務管理'},
        {id: 28, code: 'travel',              name: '旅遊'},
        {id: 29, code: 'utilities',           name: '公用'},

        {id: 99, code: 'other',               name: '其他'},
      ]
    end

    class Status < KeyValues::Base
      self.data = [
        {id: 1,  code: 'processing', name: '未發佈'},
        {id: 2,  code: 'release',    name: '已發佈'},

        {id: 99, code: 'delete',     name: '刪除'},
      ]
    end
  end

  module Bot
    class Kind < KeyValues::Base
      self.data = [
        {id: 1,  code: 'facebook', name: 'Facebook'},
        {id: 2,  code: 'line',     name: 'Line'},
        # {id: 3,  code: 'telegram', name: 'Telegram'},

        # {id: 99, code: 'other',    name: '其他'},
      ]
    end
  end
end
