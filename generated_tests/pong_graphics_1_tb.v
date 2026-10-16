`timescale 1ns/1ps

module tb_pong_graphics;

    reg video_on;
    reg [9:0] pixel_x;
    reg [9:0] pixel_y;
    wire [11:0] rgb_pic;

    // Instantiate the module under test (uut)
    pong_graphics uut (
        .video_on(video_on),
        .pixel_x(pixel_x),
        .pixel_y(pixel_y),
        .rgb_pic(rgb_pic)
    );

    initial begin
        // Test case 1: Check wall color
        video_on = 1;
        pixel_x = 33; // Inside wall range
        pixel_y = 100; // Arbitrary y
        #10;
        if (rgb_pic !== 12'hABC) begin
            $display("FAIL: Wall color check failed");
            $finish;
        end

        // Test case 2: Check bar color
        pixel_x = 601; // Inside bar range
        pixel_y = 250; // Inside bar vertical range
        #10;
        if (rgb_pic !== 12'h0F8) begin
            $display("FAIL: Bar color check failed");
            $finish;
        end

        // Test case 3: Check ball color
        pixel_x = 585; // Inside ball range
        pixel_y = 240; // Inside ball vertical range
        #10;
        if (rgb_pic !== 12'h789) begin
            $display("FAIL: Ball color check failed");
            $finish;
        end

        // Test case 4: Check background color
        pixel_x = 10; // Outside all ranges
        pixel_y = 10; // Outside all ranges
        #10;
        if (rgb_pic !== 12'h6A5) begin
            $display("FAIL: Background color check failed");
            $finish;
        end

        // Test case 5: Check video off condition
        video_on = 0; // Turn off video
        pixel_x = 100; // Arbitrary x
        pixel_y = 100; // Arbitrary y
        #10;
        if (rgb_pic !== 12'b0) begin
            $display("FAIL: Video off condition failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule