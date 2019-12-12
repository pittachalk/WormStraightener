requires("1.46r");

// Ask for user specified parameters
workDir = getDirectory("Choose a Directory");
print("Working directory: ", workDir);

wormThickness = getNumber("Specify worm thickness in pixels", 500);
print("Worm thickness set to  ", wormThickness + " pixels"); 

// **********************************************************************

// Get subdirectories and list of images
imgDir   = workDir + "img/";
coordDir = workDir + "coord/"; 
outDir   = workDir + "out/"; 

imgList = getFileList(imgDir);
coordList = getFileList(coordDir);

// **********************************************************************

// **********************************************************************

function WormStraighten(input, coord, output) {
	// straighten input, based on coord, save as output
	open(input);
	run("XY Coordinates... ", "open=" + coord);
	run("Line Width...", "line=" + wormThickness);
	run("Area to Line");
	run("Straighten...");
	saveAs("Jpeg", output);
	close();
	close();
}

// iterate over all images in imgDir
for (i=0; i<imgList.length; i++) {
	input = imgDir + imgList[i];
	coord = coordDir + coordList[i];
	output = outDir + imgList[i] + "-edit";
	print("processing... " + imgList[i]);
	WormStraighten(input, coord, output);
} 
print("finished!");
