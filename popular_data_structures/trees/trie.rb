# https://leetcode.com/problems/implement-trie-prefix-tree/

# A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.
#
#   Implement the Trie class:
#
# Trie() Initializes the trie object.
#   void insert(String word) Inserts the string word into the trie.
#   boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
#   boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
#
#
#   Example 1:
#
#   Input
# ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
# [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
# Output
# [null, null, true, false, true, null, true]
#
# Explanation
# Trie trie = new Trie();
# trie.insert("apple");
# trie.search("apple");   // return True
# trie.search("app");     // return False
# trie.startsWith("app"); // return True
# trie.insert("app");
# trie.search("app");     // return True
#
#
# Constraints:
#
#   1 <= word.length, prefix.length <= 2000
# word and prefix consist only of lowercase English letters.
#   At most 3 * 104 calls in total will be made to insert, search, and startsWith.
#

class Trie

=begin
    Initialize your data structure here.
=end
  def initialize()
    @root = {}
    @end = "#"
  end

=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
  def insert(word)
    node = @root

    0.upto(word.length - 1) do |i|
      char = word[i]
      if not node[char]
        node[char] = {}
      end
      node = node[char]
    end

    node[@end] = true
  end

=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
  def search(word)
    node = @root
    0.upto(word.length - 1) do |i|
      char = word[i]
      if not node[char]
        return false
      end
      node = node[char]
    end
    node[@end] == true
  end

=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
  def starts_with(prefix)
    node = @root
    0.upto(prefix.length - 1) do |i|
      char = prefix[i]
      if not node[char]
        return false
      end
      node = node[char]
    end
    true
  end

end

# Your Trie object will be instantiated and called as such:
obj = Trie.new()
obj.insert("apple")
obj.search("apple")
obj.search("app")
obj.starts_with("app")
obj.insert("app")
puts param_2 = obj.search("app")
obj.insert("applachian")
obj.search("applachian")
puts obj.search("apple")