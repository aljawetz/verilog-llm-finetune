`timescale 1ns/1ps

module tb_APB_Master;
    reg PCLK;
    reg PRESETn;
    reg PSEL;
    reg PENABLE;
    reg PWRITE;
    reg [7:0] PADDR;
    reg [7:0] PWDATA;
    wire [7:0] PRDATA;
    wire PREADY;

    // Instantiate the module under test (uut)
    APB_Master uut (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA),
        .PREADY(PREADY)
    );

    // Clock generation
    initial begin
        PCLK = 0;
        forever #5 PCLK = ~PCLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        PRESETn = 0;
        PSEL = 0;
        PENABLE = 0;
        PWRITE = 0;
        PADDR = 8'b0;
        PWDATA = 8'b0;

        // Apply reset
        #10;
        PRESETn = 1; // Release reset
        #10;

        // Test write operation
        PSEL = 1;
        PADDR = 8'd1;
        PWDATA = 8'hAA; // Data to write
        PWRITE = 1;
        PENABLE = 1;
        #10;

        if (uut.registers[PADDR] !== PWDATA) begin
            $display("FAIL: Write operation failed");
            $finish;
        end

        // Test read operation
        PWRITE = 0;
        PENABLE = 1;
        #10;

        if (PRDATA !== PWDATA) begin
            $display("FAIL: Read operation failed");
            $finish;
        end

        // Test another write operation
        PADDR = 8'd2;
        PWDATA = 8'h55; // New data to write
        PWRITE = 1;
        PENABLE = 1;
        #10;

        if (uut.registers[PADDR] !== PWDATA) begin
            $display("FAIL: Write operation failed for address 2");
            $finish;
        end

        // Test read operation for the new address
        PWRITE = 0;
        PENABLE = 1;
        #10;

        if (PRDATA !== PWDATA) begin
            $display("FAIL: Read operation failed for address 2");
            $finish;
        end

        // Final check for PREADY signal
        if (uut.PREADY !== 1) begin
            $display("FAIL: PREADY signal not asserted");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule