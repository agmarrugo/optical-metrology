clear all
close all
clc
%%Y = 0.299*R + 0.587*G + 0.114*B
% omeMeta = reader.getMetadataStore();
% stackSizeX = omeMeta.getPixelsSizeX(0).getValue(); % image width, pixels
% stackSizeY = omeMeta.getPixelsSizeY(0).getValue(); % image height, pixels
% stackSizeZ = omeMeta.getPixelsSizeZ(0).getValue(); % number of Z slices
%  voxelSizeX = omeMeta.getPixelsPhysicalSizeX(0).getValue(); % in ?m
%  voxelSizeY = omeMeta.getPixelsPhysicalSizeY(0).getValue(); % in ?m
%  voxelSizeZ = omeMeta.getPixelsPhysicalSizeZ(0).getValue(); % in ?m
Vec=[0.299 0.587 0.114]; %ponderar componentes de RGB
reader = bfGetReader('bloquecalibracion.nd2');
omeMeta = reader.getMetadataStore();
Nimage=reader.getImageCount();
stackSizeX = omeMeta.getPixelsSizeX(0).getValue();
stackSizeY = omeMeta.getPixelsSizeY(0).getValue();
voxelSizeX = omeMeta.getPixelsPhysicalSizeX(0).getValue(); % in ?m
voxelSizeY = omeMeta.getPixelsPhysicalSizeY(0).getValue(); % in ?m
voxelSizeZ = omeMeta.getPixelsPhysicalSizeZ(0).getValue(); % in ?m
Mmax=0*ones(stackSizeY,stackSizeX);
M=ones(stackSizeY,stackSizeX);
Zmax=ones(stackSizeY,stackSizeX);
p=1;
pos=p*ones(stackSizeY,stackSizeX);
for k= 0:Nimage-2
    if mod(k,3)==0
        I = Vec(1)*double(bfGetPlane(reader,k+1));
        for i=1:2
            I = I + Vec(i+1)*double(bfGetPlane(reader,k+1+i));
        end
        perfil(p) = I(100,100);
        p = p+1;
%         imshow(I, []);
%         pause(0.2)
    end
end
