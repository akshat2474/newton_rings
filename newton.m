clear all; close all; clc;

R = 2000;
lambda = 589e-6;
size_x = 1000;
size_y = 1000;
scale = 0.01;
max_radius = 5;

surface_defect = false;
defect_size = 0.5;
defect_height = lambda/4;
defect_x = 2;
defect_y = 1;

thin_film = false;
film_thickness = lambda/2;
film_start_x = -3;
film_end_x = 3;
film_start_y = -3;
film_end_y = 0;

[X, Y] = meshgrid((-size_x/2:size_x/2-1)*scale, (-size_y/2:size_y/2-1)*scale);
r_squared = X.^2 + Y.^2;

t = r_squared/(2*R);

if surface_defect
    defect_mask = ((X-defect_x).^2 + (Y-defect_y).^2) < defect_size^2;
    t(defect_mask) = t(defect_mask) + defect_height;
end

if thin_film
    film_mask = (X >= film_start_x) & (X <= film_end_x) & ...
                (Y >= film_start_y) & (Y <= film_end_y);
    t(film_mask) = t(film_mask) + film_thickness;
end

phase_diff = (4*pi*t)/lambda + pi;
I = cos(phase_diff/2).^2;

figure('Position', [100, 100, 800, 800]);
imagesc((-size_x/2:size_x/2-1)*scale, (-size_y/2:size_y/2-1)*scale, I);
colormap gray;
axis equal tight;
xlabel('x (mm)');
ylabel('y (mm)');
title('Newton''s Rings Simulation');
colorbar('TickLabels',{'Dark (destructive)','','','','Bright (constructive)'});

N_max = floor(2*max_radius^2/(lambda*R));
r_theoretical = zeros(N_max,1);

hold on;
for n = 1:N_max
    r_theoretical(n) = sqrt(n*lambda*R);
    if mod(n,5) == 0
        th = 0:pi/50:2*pi;
        xunit = r_theoretical(n) * cos(th);
        yunit = r_theoretical(n) * sin(th);
        plot(xunit, yunit, 'r--', 'LineWidth', 0.5);
        text(r_theoretical(n)*1.05, 0, num2str(n), 'Color', 'r');
    end
end
hold off;

disp('Theoretical Newton''s Ring Radii (mm):');
disp([1:N_max; r_theoretical']);

if thin_film
    figure;
    plot(X(size_y/2,:), I(size_y/2,:));
    title('Intensity Cross-section');
    xlabel('x (mm)');
    ylabel('Intensity');
    disp('For film thickness measurement, count the ring shift');
    disp(['Film thickness: ' num2str(film_thickness) ' mm']);
    disp(['Film thickness in wavelengths: ' num2str(film_thickness/lambda)]);
end
