
//this.getInterval(that; this���� that�� ������ ��¥���)

Date.prototype.getInterval = function (that) {
    if (this > that) {
        var intervalMili = this.getTime() - that.getTime();
    } else {
        var intervalMili = that.getTime() - this.getTime();
    }
    var intervarDay = intervalMili / (1000 * 60 * 60 * 24);  //�Լ������� �ȿ� ������ �͵� ��� �ȿ��� �� ��� �����ϴ�
    return Math.trunc(intervalDay);
}

//var intervalMili = limitday.getTime() - today.getTime();
//intervarDay = intervalMili / (1000 * 60 * 60 * 24);
