using UnityEngine;
using System.Collections;

public class Generator : MonoBehaviour {
	
	#pragma warning disable 78
	
	public GameObject dirtPrefab; 
	public GameObject grassPrefab; 
	
	int minX = -16;
	int maxX = 16;
	int minY = -10;
	int maxY = 10;
	
	PerlinNoise noise;
	
	void Start ()
    {
		noise = new PerlinNoise(Random.Range(1000000,10000000));
		Regenerate();
	}
	
    /*
     * Generates a random 2D terrain.
     */
	private void Regenerate()
    {
		
		float width = dirtPrefab.transform.localScale.x;
		float height = dirtPrefab.transform.localScale.y;
		
		for (int i = minX; i < maxX; i++)//iterate columns (x values)
        {
			int columnHeight = 2 + noise.getNoise(i - minX, maxY - minY - 2); 
            for (int j = minY; j < minY + columnHeight; j++)//iterate rows (y values)
            {
				GameObject tile = (j == minY + columnHeight - 1)?grassPrefab:dirtPrefab;
				Instantiate(tile, new Vector2(i * width, j * height), Quaternion.identity);
			}
		}
	}
}
