`timescale 1ns/1ps

module tb_pong_graphics;

    reg video_on;
    reg [9:0] pixel_x, pixel_y;
    wire [11:0] rgb_pic;

    // Instantiate the module under test
    pong_graphics uut (
        .video_on(video_on),
        .pixel_x(pixel_x),
        .pixel_y(pixel_y),
        .rgb_pic(rgb_pic)
    );

    initial begin
        // Test case 1: Video off
        video_on = 0;
        pixel_x = 100; pixel_y = 100;
        #10;
        if (rgb_pic !== 12'b0) begin
            $display("FAIL: Expected rgb_pic = 0 when video_on = 0");
            $finish;
        end

        // Test case 2: Wall region
        video_on = 1;
        pixel_x = 33; pixel_y = 150; // Inside wall region
        #10;
        if (rgb_pic !== 12'hABC) begin
            $display("FAIL: Expected rgb_pic = 12'hABC for wall region");
            $finish;
        end

        // Test case 3: Bar region
        pixel_x = 601; pixel_y = 250; // Inside bar region
        #10;
        if (rgb_pic !== 12'h0F8) begin
            $display("FAIL: Expected rgb_pic = 12'h0F8 for bar region");
            $finish;
        end

        // Test case 4: Ball region
        pixel_x = 585; pixel_y = 240; // Inside ball region
        #10;
        if (rgb_pic !== 12'h789) begin
            $display("FAIL: Expected rgb_pic = 12'h789 for ball region");
            $finish;
        end

        // Test case 5: Background region
        pixel_x = 400; pixel_y = 200; // Outside all regions
        #10;
        if (rgb_pic !== 12'h6A5) begin
            $display("FAIL: Expected rgb_pic = 12'h6A5 for background region");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule