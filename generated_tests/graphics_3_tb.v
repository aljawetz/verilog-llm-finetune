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
        pixel_x = 10'd0;
        pixel_y = 10'd0;
        #10;
        if (rgb_pic !== 12'b0) begin
            $display("FAIL: Expected rgb_pic = 0 when video_on = 0");
            $finish;
        end

        // Test 2: Wall region
        video_on = 1;
        pixel_x = 10'd33; // Inside wall region
        pixel_y = 10'd100; // Any y value
        #10;
        if (rgb_pic !== 12'h808) begin
            $display("FAIL: Expected rgb_pic = 12'h808 for wall region");
            $finish;
        end

        // Test 3: Bar region
        pixel_x = 10'd601; // Inside bar region
        pixel_y = 10'd250; // Inside bar y range
        #10;
        if (rgb_pic !== 12'hAA0) begin
            $display("FAIL: Expected rgb_pic = 12'hAA0 for bar region");
            $finish;
        end

        // Test 4: Ball region
        pixel_x = 10'd584; // Inside ball region
        pixel_y = 10'd240; // Inside ball y range
        #10;
        if (rgb_pic !== 12'hAAF) begin
            $display("FAIL: Expected rgb_pic = 12'hAAF for ball region");
            $finish;
        end

        // Test 5: Background color
        pixel_x = 10'd10; // Outside all regions
        pixel_y = 10'd10; // Outside all regions
        #10;
        if (rgb_pic !== 12'hFFF) begin
            $display("FAIL: Expected rgb_pic = 12'hFFF for background");
            $finish;
        end

        // Test 6: Video off again
        video_on = 0;
        pixel_x = 10'd500; // Any x value
        pixel_y = 10'd500; // Any y value
        #10;
        if (rgb_pic !== 12'b0) begin
            $display("FAIL: Expected rgb_pic = 0 when video_on = 0");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule