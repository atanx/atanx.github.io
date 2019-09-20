%% ∂¡»°
html = webread('http://en.wikipedia.org/wiki/List_of_countries_by_population');
soup = py.bs4.BeautifulSoup(html);

tables = soup.find_all('table');
t = cell(tables);

c = cell(t{1}.find_all('tr'));
c = cell(c)';

countries = cell(size(c));
populations = nan(size(c));

for i = 1:numel(c)
    row = c{i};
    row = cell(row.find_all('td'));
    if ~isempty(row)
        countries{i} = char(row{2}.get_text());
        populations(i) = str2double(char(row{3}.get_text()));
    end
end


data = table(countries, populations, ...
    'VariableNames', {'Country', 'Population'});
data = data(~isnan(data.Population), :);


restofWorldPopulation = sum(data.Population(11:end));
data = data(1:10, :);
data = [data;table({' Rest of World'}, restofWorldPopulation, ...
    'VariableNames', {'Country', 'Population'})]
pie(data.Population)
legend(data.Country, 'Location', 'EastOutside');
title('Distribution of World Population')