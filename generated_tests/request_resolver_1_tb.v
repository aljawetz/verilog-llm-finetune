`timescale 1ns/1ps

module tb_request_resolver;

    parameter N = 10;
    reg clk;
    reg rst_n;
    reg [N:1] buttons;
    reg [N-1:1] up_button;
    reg [N:2] dwn_button;
    reg [N:1] floor_status;
    reg up;
    reg down;
    reg open;
    wire [N:1] req;

    // Instantiate the module under test (uut)
    request_resolver #(N) uut (
        .clk(clk),
        .rst_n(rst_n),
        .buttons(buttons),
        .up_button(up_button),
        .dwn_button(dwn_button),
        .floor_status(floor_status),
        .up(up),
        .down(down),
        .open(open),
        .req(req)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        buttons = 0;
        up_button = 0;
        dwn_button = 0;
        floor_status = 0;
        up = 0;
        down = 0;
        open = 0;

        // Release reset
        #10;
        rst_n = 1;

        // Test case 1: Request for floor 3
        #10;
        buttons[3] = 1;
        #10;
        if (req !== 9'b000000100) $display("FAIL: Expected req to be 000000100 for button 3");
        
        // Test case 2: Request for floor 5 and open door
        #10;
        buttons[5] = 1;
        open = 1;
        #10;
        if (req !== 9'b000001000) $display("FAIL: Expected req to be 000001000 when open on floor 5");

        // Test case 3: Cancel request on floor 3
        #10;
        open = 0;
        floor_status[3] = 1; // Simulate being on floor 3
        #10;
        if (req !== 9'b000001000) $display("FAIL: Expected req to remain 000001000 after serving floor 3");

        // Test case 4: Request for floor 7 while going up
        #10;
        up = 1;
        buttons[7] = 1;
        #10;
        if (req !== 9'b000010000) $display("FAIL: Expected req to be 000010000 for button 7 while going up");

        // Test case 5: Request for floor 2 while going down
        #10;
        up = 0;
        down = 1;
        buttons[2] = 1;
        #10;
        if (req !== 9'b000000010) $display("FAIL: Expected req to be 000000010 for button 2 while going down");

        // Test case 6: No requests
        #10;
        buttons = 0;
        #10;
        if (req !== 9'b000000000) $display("FAIL: Expected req to be 000000000 with no requests");

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule