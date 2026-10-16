`timescale 1ns/1ps

module tb_graphics;

    // Parameters
    reg video_on;
    reg [9:0] pixel_x, pixel_y;
    wire [11:0] rgb_pic;

    // Instantiate the Unit Under Test (UUT)
    graphics uut (
        .video_on(video_on),
        .pixel_x(pixel_x),
        .pixel_y(pixel_y),
        .rgb_pic(rgb_pic)
    );

    initial begin
        // Test 1: Video off
        video_on = 0;
        pixel_x = 32; pixel_y = 240; #10;
        if (rgb_pic !== 12'b0) begin
            $display("FAIL: Expected rgb_pic to be 0 when video is off");
            $finish;
        end

        // Test 2: Wall region
        video_on = 1;
        pixel_x = 32; pixel_y = 240; #10;
        if (rgb_pic !== 12'h808) begin
            $display("FAIL: Expected rgb_pic to be wall color (12'h808) at (32, 240)");
            $finish;
        end

        // Test 3: Bar region
        pixel_x = 600; pixel_y = 250; #10;
        if (rgb_pic !== 12'hAA0) begin
            $display("FAIL: Expected rgb_pic to be bar color (12'hAA0) at (600, 250)");
            $finish;
        end

        // Test 4: Ball region
        pixel_x = 580; pixel_y = 240; #10;
        if (rgb_pic !== 12'hAAF) begin
            $display("FAIL: Expected rgb_pic to be ball color (12'hAAF) at (580, 240)");
            $finish;
        end

        // Test 5: Background color
        pixel_x = 100; pixel_y = 100; #10;
        if (rgb_pic !== 12'hFFF) begin
            $display("FAIL: Expected rgb_pic to be background color (12'hFFF) at (100, 100)");
            $finish;
        end

        // Test 6: Outside wall, bar, and ball
        pixel_x = 700; pixel_y = 700; #10;
        if (rgb_pic !== 12'hFFF) begin
            $display("FAIL: Expected rgb_pic to be background color (12'hFFF) at (700, 700)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule