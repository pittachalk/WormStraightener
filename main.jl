using Images, ImageView, DelimitedFiles, DataInterpolations

img = load("data/sample.jpg");
imshow(img);

# read coordinates
coord = readdlm("data/coordinates.txt", '\t', Int);

# plot the coordinates on the sample picture
img_ch_view = channelview(img); # channel, height, width
img_ch_view = permuteddimsview(img_ch_view, (2,3,1)); # height, width, channel

for i in 1:size(coord, 1)
    x = coord[i, 1];
    y = coord[i, 2];
    img_ch_view[x-10:x+10, y-10:y+10, 1] .= 1;
end
imshow(img);

# interpolate line with approximate distance d between points
spline = LinearInterpolation(coord[:,1], coord[:,2])

spline = BSplineInterpolation(collect(Float64, coord[:,1]), collect(Float64, coord[:,2]), 3,:ArcLen,:Average);

u = [14.7, 11.51, 10.41, 14.95, 12.24, 11.22]
t = [0.0, 62.25, 109.66, 162.66, 205.8, 252.3]
A = BSplineInterpolation(u,t,3,:ArcLen,:Average);
scatter(t, u, label="input data")
plot!(A)

using Splines
ts = [linspace(-10,10,50);] # knot sequence
vs = cos(ts) # signal values at knots
m = 4 # cubic splines
S = Spline(vs, ts, m)


using SmoothingSplines
X = collect(Float64, coord[:,1]);
Y = collect(Float64, coord[:,2]);
spl = fit(SmoothingSpline, X, Y, 250.0);
Ypred = SmoothingSplines.predict(spl) # fitted vector

using Plots
scatter(X, Y);
plot!()

plot(layer(x=X, y=Y, Geom.point), layer(x=X, y=Ypred, Geom.line, 	Theme(default_color=colorant"red")))

SmoothingSplines.predict(spl, 20.0) #prediction at arbitrary point