#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Output directory", style = "directory") output
#@ String (label = "File suffix", value = ".tif") suffix

// Check off the "Split channel" for this macro to work
// TYL: I have not written a proofreading function yet! 
// See also Process_Folder.py for a version of this code
// in the Python scripting language.

// This macro demonstrates how to randomize the contents of an array
// (e.g., a list of file names) using the Fisher Yates shuffle:
//    http://en.wikipedia.org/wiki/Fisher-Yates_shuffle

// As a test, randomize a list of prime numbers
letters = newArray("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9");
shuffle(letters);

function shuffle(array) {
   n = array.length;  // The number of items left to shuffle (loop invariant).
   while (n > 1) {
      k = randomInt(n);     // 0 <= k < n.
      n--;                  // n is now the last pertinent index;
      temp = array[n];  // swap array[n] with array[k] (does nothing if k==n).
      array[n] = array[k];
      array[k] = temp;
   }
}

// returns a random number, 0 <= k < n
function randomInt(n) {
   return n * random();
}

processFolder(input);
// function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
	list = getFileList(input);
	list = Array.sort(list);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + File.separator + list[i]))
			processFolder(input + File.separator + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
			shuffle(letters);
	}
}

function processFile(input, output, file) {
	// Do the processing here by adding your own code.
	// Leave the print statements until things work, then remove them.
	print(input, output);
	open(input + File.separator + list[i]);
	T = getTitle();
	selectWindow(T);
	rename(letters[1]+letters[2]+letters[3]+letters[4]+letters[5]+letters[6]);
	newT = getTitle();
    setResult("Orignal", i, T);
    setResult("New", i, newT);
	saveAs("Tiff", output+"/"+newT);
    close();
}

updateResults;
saveAs("Results", input+"/"+"codes.csv");

run("Close All");
