using UnityEngine;
using System.Collections;

public class PerlinNoise {
	
	long seed;
	
	public PerlinNoise(long seed)
        {
		this.seed = seed;
	}
	
    /*
     * random - returns a randomly generated seed of a certain range.
     * @param int x - minimum to int start at.
     * @param int range - maximum possible value.
     */
	private int random(long x, int range)
        {
		return (int)(((x+seed)^5) % range);
	}
	
    /**
     * getNoise - Returns a random int between the chunkSize and Range
     * @param int x - minimum int to start at.
     * @param int range - the maximum possible value.
     */
	public int getNoise(int x, int range)
        {
		int chunkSize = 16;
		float noise = 0;
		
		range /= 2;
		
		while(chunkSize > 0)
		{
			int chunkIndex = x / chunkSize;
			float prog = (x % chunkSize) / (chunkSize * 1f);
			float lRandom = random(chunkIndex, range);
			float rRandom = random(chunkIndex + 1, range);
			
			
			noise += (1-prog) * lRandom + prog * rRandom;
			
			chunkSize /= 2;
			range /= 2;
			
			range = Mathf.Max(1,range);
		}
		
		return (int)Mathf.Round(noise);
	}
}
