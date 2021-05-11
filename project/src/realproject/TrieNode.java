package realproject;

/**
 * @author Team ACC (Amrit, Diyanshi, Gurpreet, Mounika, Neha)
 * Node Data Structure for Trie
 */
public class TrieNode {

	TrieNode[] nodes = new TrieNode[26];
	int count;
	boolean isEnd;

	public int getValue() {
		return count;
	}

	public void incrementValue() {
		count++;
	}
}